"""
Simple HTTP server for 0101 project.
Serves static files as before, plus two REST endpoints to persist textarea text:

  GET  /api/text/<key>  ->  returns saved text (empty string if not yet saved)
  POST /api/text/<key>  ->  saves request body to saved/<key>.txt

Run: python server.py
Then open: http://localhost:8080/index.html
"""
import http.server
import html
import io
import os
import re
import shutil
import subprocess
import sys
import threading
import time
import webbrowser
from urllib.parse import quote, unquote, urlsplit

PORT = 8080
WEB_ROOT = os.path.dirname(__file__)
SAVED_DIR = os.path.join(WEB_ROOT, "saved")
KEY_RE = re.compile(r'^[a-z0-9][a-z0-9-]{0,63}$')
DEFAULT_0101_WINDOW_WIDTH = 720
DEFAULT_0101_WINDOW_HEIGHT = 1180

# Watchdog: shut down if no browser activity or ping is received within this many
# seconds. Pages keep the server alive with /api/ping heartbeats while they
# remain open, and ordinary page/asset requests also refresh activity.
SHUTDOWN_TIMEOUT = 60

_ping_lock = threading.Lock()
_last_ping = time.time()
_web_files = None
HTML_DARK_BOOTSTRAP_STYLE = """<style id="tm-dark-bootstrap">
html, body {
  background: #0d1117 !important;
  background-color: #0d1117 !important;
  color: #e6edf3 !important;
  color-scheme: dark !important;
}
body, div, section, article, main, aside, nav, header, footer, p, li, ul, ol,
dl, dt, dd, pre, code, tt, font, center, marquee, table, thead, tbody, tfoot,
tr, td, th {
  color: #e6edf3 !important;
}
body[bgcolor], table[bgcolor], tr[bgcolor], td[bgcolor], th[bgcolor],
.w3-white, .w3-yellow, .w3-blue, .w3-red, .w3-green, .w3-grey {
  background: #21262d !important;
  background-color: #21262d !important;
}
[style*="background-color: white"], [style*="background-color:white"],
[style*="background: white"], [style*="background:white"],
[style*="background-color: yellow"], [style*="background-color: cyan"],
[style*="background-color: red"], [style*="background-color: green"],
[style*="background-color: grey"], [style*="background-color: gray"] {
  background: #161b22 !important;
  background-color: #161b22 !important;
  color: #e6edf3 !important;
}
</style>
"""
HTML_SHELL_STYLESHEET = '<link rel="stylesheet" href="/0101-shell.css">\n'
HTML_PERSIST_SCRIPT = '<script src="/persist.js"></script>\n'
HTML_SHELL_SCRIPT = '<script src="/0101-shell.js"></script>\n'
LEGACY_ASSET_ALIASES = {
    "/key_files/w3.js.download": "0101_files/w3.js.download",
    "/PDFs/SM/0101.html": "0101.html",
}
IMAGE_FALLBACK_EXTENSIONS = (
    ".gif",
    ".png",
    ".jpg",
    ".jpeg",
    ".webp",
    ".bmp",
    ".svg",
)
TRAVELLER_SCRIPTS_STUB = b"window.TravellerScripts = window.TravellerScripts || {};\n"


class Handler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-store, no-cache, must-revalidate")
        self.send_header("Pragma", "no-cache")
        self.send_header("Expires", "0")
        super().end_headers()

    def do_HEAD(self):
        request_path = urlsplit(self.path).path
        if request_path == "/favicon.ico":
            self.send_response(204)
            self.send_header("Content-Length", "0")
            self.end_headers()
            return
        if self._serve_legacy_asset(request_path, head_only=True):
            return
        super().do_HEAD()

    def list_directory(self, path):
        try:
            entries = os.listdir(path)
        except OSError:
            self.send_error(404, "No permission to list directory")
            return None

        entries.sort(key=str.lower)
        request_path = urlsplit(self.path).path or "/"
        display_path = html.escape(unquote(request_path))
        title = f"Directory listing for {display_path}"

        items = []
        normalized_path = request_path.rstrip("/")
        if normalized_path:
            parent = normalized_path.rsplit("/", 1)[0]
            parent_href = (parent + "/") if parent else "/"
            items.append(
                f'<li><a href="{quote(parent_href, safe="/%")}">..</a></li>'
            )

        for name in entries:
            full_path = os.path.join(path, name)
            display_name = name + "/" if os.path.isdir(full_path) else name
            href_name = quote(display_name, safe="/%")
            items.append(
                f'<li><a href="{href_name}">{html.escape(display_name)}</a></li>'
            )

        document = f"""<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title}</title>
    <link rel="stylesheet" href="/0101-shell.css">
    <style>
      .tm-directory {{
        width: min(1180px, calc(100% - 1rem));
        margin: 0 auto 2rem;
        display: grid;
        gap: 1rem;
      }}

      .tm-directory-card {{
        padding: 1rem 1.1rem;
        border: 1px solid var(--tm-border);
        border-radius: 18px;
        background: linear-gradient(180deg, rgba(22, 27, 34, 0.98), rgba(18, 22, 28, 0.98));
        box-shadow: var(--tm-shadow);
      }}

      .tm-directory-card h1 {{
        margin-top: 0;
        margin-bottom: 0.5rem;
      }}

      .tm-directory-list {{
        list-style: none;
        padding: 0;
        margin: 0;
        display: grid;
        gap: 0.55rem;
      }}

      .tm-directory-list a {{
        display: block;
        padding: 0.55rem 0.8rem;
        border: 1px solid var(--tm-border);
        border-radius: 14px;
        background: var(--tm-panel-alt);
        color: var(--tm-text) !important;
        text-decoration: none;
      }}

      .tm-directory-list a:hover,
      .tm-directory-list a:focus {{
        border-color: var(--tm-accent);
        background: rgba(88, 166, 255, 0.12);
      }}

      .tm-directory-path {{
        color: var(--tm-muted);
        word-break: break-word;
      }}
    </style>
  </head>
  <body>
    <main class="tm-directory">
      <section class="tm-directory-card">
        <h1>{title}</h1>
        <p class="tm-directory-path">{display_path}</p>
        <ul class="tm-directory-list">
          {''.join(items)}
        </ul>
      </section>
    </main>
    <script src="/persist.js"></script>
    <script src="/0101-shell.js"></script>
  </body>
</html>
"""

        encoded = document.encode("utf-8", "surrogateescape")
        file_object = io.BytesIO()
        file_object.write(encoded)
        file_object.seek(0)
        self.send_response(200)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Content-Length", str(len(encoded)))
        self.end_headers()
        return file_object

    def _touch_ping(self):
        global _last_ping
        with _ping_lock:
            _last_ping = time.time()

    def _shutdown_response(self):
        self.send_response(204)
        self.send_header("Content-Length", "0")
        self.end_headers()
        print("Ignoring /api/shutdown; server lifetime is heartbeat-controlled.")

    def do_GET(self):
        request_path = urlsplit(self.path).path
        if self.path.rstrip("/") == "/api/ping":
            self._touch_ping()
            self.send_response(204)
            self.send_header("Content-Length", "0")
            self.end_headers()
            return
        if self.path.rstrip("/") == "/api/shutdown":
            self._shutdown_response()
            return
        if request_path == "/favicon.ico":
            self.send_response(204)
            self.send_header("Content-Length", "0")
            self.end_headers()
            return
        key = self._api_key()
        if key is None:
            self._touch_ping()
            if self._serve_legacy_asset(request_path):
                return
            if self._serve_html_with_shell():
                return
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
        if self.path.rstrip("/") == "/api/shutdown":
            self._shutdown_response()
            return
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

    def _serve_html_with_shell(self):
        """Serve HTML files with the shared dark-mode shell injected."""
        request_path = urlsplit(self.path).path
        if not request_path.lower().endswith(".html"):
            return False

        file_path = self.translate_path(request_path)
        if not os.path.isfile(file_path):
            return False

        try:
            with open(file_path, "r", encoding="utf-8", errors="replace") as handle:
                content = handle.read()
        except OSError:
            self.send_error(404)
            return True

        content = self._rewrite_legacy_file_urls(content, file_path)
        content = self._normalize_html_document(content, request_path)
        content = self._inject_shell_assets(content)
        data = content.encode("utf-8")
        self.send_response(200)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)
        return True

    def _serve_legacy_asset(self, request_path, head_only=False):
        alias_path = LEGACY_ASSET_ALIASES.get(request_path)
        if alias_path:
            target_path = os.path.join(WEB_ROOT, alias_path)
            if os.path.isfile(target_path):
                return self._serve_binary_file(target_path, head_only=head_only)

        if request_path == "/TravellerScripts.js":
            return self._serve_bytes(
                TRAVELLER_SCRIPTS_STUB,
                "application/javascript; charset=utf-8",
                head_only=head_only,
            )

        translated_path = self.translate_path(request_path)
        if os.path.exists(translated_path):
            return False

        if request_path.lower().endswith(IMAGE_FALLBACK_EXTENSIONS):
            placeholder_path = os.path.join(WEB_ROOT, "missing-asset.svg")
            if os.path.isfile(placeholder_path):
                return self._serve_binary_file(
                    placeholder_path,
                    content_type="image/svg+xml",
                    head_only=head_only,
                )

        return False

    def _serve_binary_file(self, file_path, content_type=None, head_only=False):
        try:
            with open(file_path, "rb") as handle:
                data = handle.read()
        except OSError:
            self.send_error(404)
            return True

        return self._serve_bytes(
            data,
            content_type or self.guess_type(file_path),
            head_only=head_only,
        )

    def _serve_bytes(self, data, content_type, head_only=False):
        self.send_response(200)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        if not head_only:
            self.wfile.write(data)
        return True

    @staticmethod
    def _rewrite_legacy_file_urls(content, file_path):
        pattern = re.compile(
            r'(?P<attr>href|src)(?P<spacing>\s*=\s*)(?P<quote>["\'])'
            r'(?P<value>file:///[^"\']+)(?P=quote)',
            flags=re.IGNORECASE,
        )

        def replace(match):
            resolved = Handler._resolve_legacy_file_url(match.group("value"), file_path)
            if not resolved:
                resolved = Handler._fallback_legacy_file_url(match.group("value"))
            if not resolved:
                return match.group(0)
            return (
                f'{match.group("attr")}{match.group("spacing")}'
                f'{match.group("quote")}{resolved}{match.group("quote")}'
            )

        return pattern.sub(replace, content)

    @staticmethod
    def _normalize_html_document(content, request_path):
        title = os.path.basename(unquote(request_path)) or "0101"
        has_html = re.search(r"<html\b", content, flags=re.IGNORECASE)
        has_body = re.search(r"<body\b", content, flags=re.IGNORECASE)
        has_head = re.search(r"<head\b", content, flags=re.IGNORECASE)

        if not has_html or not has_body:
            body_content = re.sub(
                r"<!DOCTYPE\s+html[^>]*>",
                "",
                content,
                count=1,
                flags=re.IGNORECASE,
            )
            body_content = re.sub(r"</body\s*>", "", body_content, flags=re.IGNORECASE)
            body_content = re.sub(r"</html\s*>", "", body_content, flags=re.IGNORECASE)
            body_content = body_content.strip()
            if not has_head:
                return f"""<!DOCTYPE html>
<html lang="en" style="background:#0d1117 !important;background-color:#0d1117 !important;color:#e6edf3 !important;color-scheme:dark !important;">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{html.escape(title)}</title>
  </head>
  <body style="background:#0d1117 !important;background-color:#0d1117 !important;color:#e6edf3 !important;">
    <main style="width:min(1180px,calc(100% - 1rem));margin:0 auto 2rem;padding:1rem;">
      <article style="padding:1rem 1.1rem;border:1px solid #30363d;border-radius:18px;background:linear-gradient(180deg,rgba(22,27,34,0.98),rgba(18,22,28,0.98));box-shadow:0 14px 32px rgba(0,0,0,0.24);">
{body_content}
      </article>
    </main>
  </body>
</html>
"""

        content = Handler._stamp_tag_style(
            content,
            "html",
            "background:#0d1117 !important;background-color:#0d1117 !important;color:#e6edf3 !important;color-scheme:dark !important;",
        )
        content = Handler._stamp_tag_style(
            content,
            "body",
            "background:#0d1117 !important;background-color:#0d1117 !important;color:#e6edf3 !important;",
        )
        if not has_head:
            content = re.sub(
                r"<html\b([^>]*)>",
                r"<html\1><head><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><title>"
                + html.escape(title)
                + r"</title></head>",
                content,
                count=1,
                flags=re.IGNORECASE,
            )
        return content

    @staticmethod
    def _stamp_tag_style(content, tag_name, style_value):
        pattern = re.compile(rf"<{tag_name}\b(?P<attrs>[^>]*)>", flags=re.IGNORECASE)

        def replace(match):
            attrs = match.group("attrs") or ""
            if re.search(r"\sstyle\s*=", attrs, flags=re.IGNORECASE):
                attrs = re.sub(
                    r'(?P<prefix>\sstyle\s*=\s*["\'])(?P<value>.*?)(?P<suffix>["\'])',
                    lambda style_match: (
                        f"{style_match.group('prefix')}{style_match.group('value').rstrip(';')};{style_value}{style_match.group('suffix')}"
                    ),
                    attrs,
                    count=1,
                    flags=re.IGNORECASE,
                )
            else:
                attrs = f'{attrs} style="{style_value}"'
            return f"<{tag_name}{attrs}>"

        return pattern.sub(replace, content, count=1)

    @staticmethod
    def _resolve_legacy_file_url(raw_url, file_path):
        decoded_path = unquote(urlsplit(raw_url).path)
        if not decoded_path:
            return None

        segments = [
            segment
            for segment in decoded_path.split("/")
            if segment and not re.fullmatch(r"[A-Za-z]:", segment)
        ]
        if not segments:
            return None

        current_dir = os.path.dirname(file_path)
        for width in range(min(3, len(segments)), 0, -1):
            suffix = "/".join(segments[-width:]).lower()
            matches = [
                relative_path
                for relative_path in Handler._list_web_files()
                if relative_path.lower().endswith(suffix)
            ]
            if not matches:
                continue

            if width >= 2:
                preferred_parent = segments[-2].lower()
                parent_matches = [
                    relative_path
                    for relative_path in matches
                    if os.path.basename(os.path.dirname(relative_path)).lower()
                    == preferred_parent
                ]
                if parent_matches:
                    matches = parent_matches

            target_relative = min(matches, key=len)
            target_path = os.path.join(WEB_ROOT, target_relative)
            relative_path = os.path.relpath(target_path, start=current_dir)
            return relative_path.replace(os.sep, "/")

        return None

    @staticmethod
    def _fallback_legacy_file_url(raw_url):
        decoded_path = unquote(urlsplit(raw_url).path).lower()
        if decoded_path.endswith((".gif", ".png", ".jpg", ".jpeg", ".webp", ".bmp", ".svg")):
            return "/missing-asset.svg"
        return "#missing-local-file"

    @staticmethod
    def _list_web_files():
        global _web_files
        if _web_files is None:
            collected = []
            for root, _dirs, files in os.walk(WEB_ROOT):
                for filename in files:
                    full_path = os.path.join(root, filename)
                    relative_path = os.path.relpath(full_path, start=WEB_ROOT)
                    collected.append(relative_path.replace(os.sep, "/"))
            _web_files = tuple(sorted(collected))
        return _web_files

    @staticmethod
    def _inject_shell_assets(content):
        """Add shared shell assets to HTML without duplicating existing tags."""
        if "tm-dark-bootstrap" not in content:
            content = Handler._insert_asset(
                content,
                r"</head\s*>",
                HTML_DARK_BOOTSTRAP_STYLE,
                fallback_pattern=r"<body[^>]*>",
                fallback_before=True,
                prepend_if_missing=True,
            )
        if '/0101-shell.css' not in content:
            content = Handler._insert_asset(
                content,
                r"</head\s*>",
                HTML_SHELL_STYLESHEET,
                fallback_pattern=r"<body[^>]*>",
                fallback_before=True,
                prepend_if_missing=True,
            )
        if '/persist.js' not in content:
            content = Handler._insert_asset(
                content,
                r"</body\s*>",
                HTML_PERSIST_SCRIPT,
                fallback_pattern=r"</html\s*>",
                fallback_before=True,
            )
        if '/0101-shell.js' not in content:
            content = Handler._insert_asset(
                content,
                r"</body\s*>",
                HTML_SHELL_SCRIPT,
                fallback_pattern=r"</html\s*>",
                fallback_before=True,
            )
        return content

    @staticmethod
    def _insert_asset(
        content,
        pattern,
        asset,
        fallback_pattern=None,
        fallback_before=False,
        prepend_if_missing=False,
    ):
        match = re.search(pattern, content, flags=re.IGNORECASE)
        if match:
            return content[: match.start()] + asset + content[match.start() :]

        if fallback_pattern:
            fallback_match = re.search(fallback_pattern, content, flags=re.IGNORECASE)
            if fallback_match:
                if fallback_before:
                    return (
                        content[: fallback_match.start()]
                        + asset
                        + content[fallback_match.start() :]
                    )
                return (
                    content[: fallback_match.end()]
                    + asset
                    + content[fallback_match.end() :]
                )

        if prepend_if_missing:
            return asset + content

        return content + asset

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


class ReusableThreadingHTTPServer(http.server.ThreadingHTTPServer):
    allow_reuse_address = True


def main():
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    with ReusableThreadingHTTPServer(("", PORT), Handler) as httpd:
        print(f"Serving on http://localhost:{PORT}/")
        threading.Thread(target=_watchdog, args=(httpd,), daemon=True).start()
        threading.Timer(
            1.0,
            _open_0101_browser,
            args=(f"http://localhost:{PORT}/index.html",),
        ).start()
        httpd.serve_forever()
    print("Server stopped.")

if __name__ == "__main__":
    main()
