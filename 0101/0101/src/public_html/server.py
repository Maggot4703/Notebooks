"""
Simple HTTP server for 0101 project.
Serves static files as before, plus two REST endpoints to persist textarea text:

  GET  /api/text/<key>  ->  returns saved text (empty string if not yet saved)
  POST /api/text/<key>  ->  saves request body to saved/<key>.txt

Run: python server.py
Then open: http://localhost:8080/1-Scout.html
"""
import http.server
import os
import re
import sys
import threading
import time
import webbrowser

PORT = 8080
SAVED_DIR = os.path.join(os.path.dirname(__file__), "saved")
KEY_RE = re.compile(r'^[a-z0-9][a-z0-9-]{0,63}$')

# Watchdog: shut down if no browser ping received within this many seconds.
# Primary shutdown is via /api/shutdown (sent by persist.js on tab close).
# This timeout is a safety net for pages without persist.js.
SHUTDOWN_TIMEOUT = 60

_ping_lock = threading.Lock()
_last_ping = time.time()


class Handler(http.server.SimpleHTTPRequestHandler):

    def do_GET(self):
        if self.path.rstrip('/') == '/api/ping':
            global _last_ping
            with _ping_lock:
                _last_ping = time.time()
            self.send_response(204)
            self.send_header('Content-Length', '0')
            self.end_headers()
            return
        if self.path.rstrip('/') == '/api/shutdown':
            self.send_response(204)
            self.send_header('Content-Length', '0')
            self.end_headers()
            print("Browser tab closed — shutting down.")
            threading.Thread(target=self.server.shutdown, daemon=True).start()
            return
        key = self._api_key()
        if key is None:
            super().do_GET()
            return
        path = os.path.join(SAVED_DIR, f"{key}.txt")
        if os.path.isfile(path):
            with open(path, "r", encoding="utf-8") as f:
                content = f.read()
        else:
            content = ""
        data = content.encode("utf-8")
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def do_POST(self):
        key = self._api_key()
        if key is None:
            self.send_error(404)
            return
        length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(length).decode("utf-8")
        os.makedirs(SAVED_DIR, exist_ok=True)
        path = os.path.join(SAVED_DIR, f"{key}.txt")
        with open(path, "w", encoding="utf-8") as f:
            f.write(body)
        self.send_response(200)
        self.send_header("Content-Length", "0")
        self.end_headers()

    def _api_key(self):
        """Return the key if the path is /api/text/<key>, else None."""
        if not self.path.startswith("/api/text/"):
            return None
        key = self.path[len("/api/text/"):]
        # strip query string
        key = key.split("?")[0]
        if not KEY_RE.match(key):
            return None
        return key

    def log_message(self, fmt, *args):
        # Keep console output readable
        sys.stderr.write(f"{self.address_string()} - {fmt % args}\n")


def _watchdog(httpd):
    """Shut down the server if no ping is received within SHUTDOWN_TIMEOUT seconds."""
    while True:
        time.sleep(1)
        with _ping_lock:
            idle = time.time() - _last_ping
        if idle > SHUTDOWN_TIMEOUT:
            print(f"No browser ping for {SHUTDOWN_TIMEOUT}s — shutting down.")
            httpd.shutdown()
            break


if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    with http.server.ThreadingHTTPServer(("", PORT), Handler) as httpd:
        print(f"Serving on http://localhost:{PORT}/")
        threading.Thread(target=_watchdog, args=(httpd,), daemon=True).start()
        threading.Timer(1.0, webbrowser.open, args=(f"http://localhost:{PORT}/1-Scout.html",)).start()
        httpd.serve_forever()
    print("Server stopped.")
