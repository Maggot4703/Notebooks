import os
import time
import threading
import requests

import server

WEB_ROOT = server.WEB_ROOT


def start_server():
    # bind to an ephemeral port to avoid clashes with an already-running server
    httpd = server.ReusableThreadingHTTPServer(("", 0), server.Handler)
    port = httpd.server_address[1]
    thread = threading.Thread(target=httpd.serve_forever, daemon=True)
    thread.start()
    # wait for server to accept connections
    for _ in range(10):
        try:
            r = requests.get(f"http://127.0.0.1:{port}/index.html", timeout=1)
            if r.status_code == 200:
                break
        except Exception:
            time.sleep(0.2)
    return httpd, thread, port


def stop_server(httpd):
    try:
        httpd.shutdown()
        httpd.server_close()
    except Exception:
        pass


def test_post_get_persistence(tmp_path):
    key = "testkey"
    saved_dir = os.path.join(WEB_ROOT, "saved")
    saved_path = os.path.join(saved_dir, f"{key}.txt")
    # ensure clean
    if os.path.exists(saved_path):
        os.remove(saved_path)

    httpd, thread, port = start_server()
    try:
        url = f"http://127.0.0.1:{port}/api/text/{key}"
        payload = "hello world\nline2"
        r = requests.post(url, data=payload.encode("utf-8"), timeout=2)
        assert r.status_code == 200

        r2 = requests.get(url, timeout=2)
        assert r2.status_code == 200
        assert r2.text == payload

        # file was written
        assert os.path.isfile(saved_path)
        with open(saved_path, "r", encoding="utf-8") as fh:
            assert fh.read() == payload
    finally:
        stop_server(httpd)
        if os.path.exists(saved_path):
            os.remove(saved_path)


def test_invalid_key_rejected():
    httpd, thread, port = start_server()
    try:
        url = f"http://127.0.0.1:{port}/api/text/InvalidKey"
        r = requests.post(url, data=b"x", timeout=2)
        assert r.status_code == 404
    finally:
        stop_server(httpd)
