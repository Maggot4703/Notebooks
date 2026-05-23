import time

from playwright.sync_api import sync_playwright


def test_persist_via_fetch():
    key = "playwright-test"
    base = "http://127.0.0.1:8080"
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        page.goto(base + "/index.html")
        # POST via fetch from the page context
        payload = "pw hello"
        page.evaluate(
            "(k,p) => fetch(`/api/text/${k}`, {method:'POST', body: p})", key, payload
        )
        # give server a moment to write
        time.sleep(0.5)
        # GET via fetch
        result = page.evaluate("(k) => fetch(`/api/text/${k}`).then(r=>r.text())", key)
        assert payload in result
        browser.close()
