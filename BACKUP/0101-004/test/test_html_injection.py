import server


def test_inject_shell_assets_inserts_once():
    content = "<html><head></head><body><h1>Hi</h1></body></html>"
    out = server.Handler._inject_shell_assets(content)
    # assets should be present
    assert "/0101-shell.css" in out
    assert "/0101-shell.js" in out
    assert "/persist.js" in out

    # Running again should not duplicate the assets
    out2 = server.Handler._inject_shell_assets(out)
    assert out == out2
