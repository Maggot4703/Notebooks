import server


def test_normalize_html_document_basic():
    sample = "<html><head><title>Test</title></head><body><h1>Hi</h1></body></html>"
    out = server.Handler._normalize_html_document(sample, "/index.html")
    assert isinstance(out, str)
    assert "<html" in out.lower()
    assert "<body" in out.lower()


def test_rewrite_legacy_file_urls_no_crash():
    sample = '<a href="file:///C:/old/path/asset.js">link</a>'
    # Should not raise and should return a string
    out = server.Handler._rewrite_legacy_file_urls(sample, "/index.html")
    assert isinstance(out, str)
    # The function either rewrites or returns the original; ensure 'file:///' is not introduced twice
    assert out.count("file:///") <= 1
