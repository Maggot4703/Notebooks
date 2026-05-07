"""
Simple HTTP server for 0101 project.
Serves static files as before, plus two REST endpoints to persist textarea text:

  GET  /api/text/<key>  ->  returns saved text (empty string if not yet saved)
  POST /api/text/<key>  ->  saves request body to saved/<key>.txt

Run: python server.py
Then open: http://localhost:8080/0101.html
"""
import http.server
import os
import re
import shutil
import subprocess
import sys
import threading
import time
import webbrowser

PORT = 8080
SAVED_DIR = os.path.join(os.path.dirname(__file__), "saved")
KEY_RE = re.compile(r'^[a-z0-9][a-z0-9-]{0,63}$')
DEFAULT_0101_WINDOW_WIDTH = 720
DEFAULT_0101_WINDOW_HEIGHT = 1180

# Watchdog: shut down if no browser ping received within this many seconds.
# Primary shutdown is via /api/shutdown (sent by persist.js on tab close).
# This timeout is a safety net for pages without persist.js.
SHUTDOWN_TIMEOUT = 600

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


def _resize_window_by_title(
    window_title, width, height, attempts=10, delay_seconds=0.5
):
    """Resize a browser window by title when a desktop window manager tool exists."""
    if not os.environ.get("DISPLAY"):
        return False

    for command in ("wmctrl", "xdotool"):
        if not shutil.which(command):
            continue
        for _ in range(attempts):
            try:
                if command == "wmctrl":
                    subprocess.run(
                        ["wmctrl", "-r", window_title, "-e", f"0,-1,-1,{width},{height}"],
                        check=True,
                        capture_output=True,
                        text=True,
                    )
                    return True

                search_result = subprocess.run(
                    ["xdotool", "search", "--name", window_title],
                    check=True,
                    capture_output=True,
                    text=True,
                )
                window_ids = [
                    window_id
                    for window_id in search_result.stdout.splitlines()
                    if window_id.strip()
                ]
                if not window_ids:
                    time.sleep(delay_seconds)
                    continue
                subprocess.run(
                    [
                        "xdotool",
                        "windowsize",
                        window_ids[-1],
                        str(width),
                        str(height),
                    ],
                    check=True,
                    capture_output=True,
                    text=True,
                )
                return True
            except subprocess.CalledProcessError:
                time.sleep(delay_seconds)
    return False


def _open_0101_browser(url):
    """Open 0101 in a new browser window and resize it for the page layout."""
    webbrowser.open(url, new=1)
    threading.Thread(
        target=_resize_window_by_title,
        args=("0101", DEFAULT_0101_WINDOW_WIDTH, DEFAULT_0101_WINDOW_HEIGHT),
        daemon=True,
    ).start()


def main():
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    with http.server.ThreadingHTTPServer(("", PORT), Handler) as httpd:
        print(f"Serving on http://localhost:{PORT}/")
        threading.Thread(target=_watchdog, args=(httpd,), daemon=True).start()
        threading.Timer(
            1.0,
            _open_0101_browser,
            args=(f"http://localhost:{PORT}/0101.html",),
        ).start()
        httpd.serve_forever()
    print("Server stopped.")

if __name__ == "__main__":
    main()
