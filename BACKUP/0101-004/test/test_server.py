import os
import sys

# Ensure the server module can be imported from src/public_html
ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
sys.path.insert(0, os.path.join(ROOT, "src", "public_html"))

import server


class Dummy:
    pass


def test_key_re():
    assert server.KEY_RE.match("abc")
    assert server.KEY_RE.match("a1-2")
    assert not server.KEY_RE.match("A")  # uppercase not allowed
    assert not server.KEY_RE.match("-bad")  # must start with alnum


def test_api_key_parsing():
    d = Dummy()
    d.path = "/api/text/foo"
    assert server.Handler._api_key(d) == "foo"

    d.path = "/api/text/BadKey"
    assert server.Handler._api_key(d) is None

    d.path = "/other/path"
    assert server.Handler._api_key(d) is None


def test_constants():
    assert isinstance(server.PORT, int)
