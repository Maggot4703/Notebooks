import os
import time
from playwright.sync_api import sync_playwright


def test_shell_injection():
    # Requires `playwright` and browsers installed (`playwright install`)
    artifacts = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'artifacts'))
    os.makedirs(artifacts, exist_ok=True)
    ts = int(time.time())
    screenshot_path = os.path.join(artifacts, f'playwright-{ts}.png')
    html_path = os.path.join(artifacts, f'playwright-{ts}.html')

    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        try:
            page.goto("http://127.0.0.1:8080/index.html", timeout=10000)
            content = page.content()
            assert '0101-shell.js' in content
        except Exception:
            try:
                page.screenshot(path=screenshot_path, full_page=True)
            except Exception:
                pass
            try:
                with open(html_path, 'w', encoding='utf-8') as fh:
                    fh.write(page.content())
            except Exception:
                pass
            raise
        finally:
            browser.close()
