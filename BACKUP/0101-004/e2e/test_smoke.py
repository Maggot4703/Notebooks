import time

import requests


def test_index_served():
    url = "http://127.0.0.1:8080/index.html"
    r = None
    for _ in range(10):
        try:
            r = requests.get(url, timeout=2)
            if r.status_code == 200:
                break
        except Exception:
            time.sleep(0.5)
    assert r is not None and r.status_code == 200
    assert "0101-shell.js" in r.text
