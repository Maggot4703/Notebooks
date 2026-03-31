import os
import tempfile
import subprocess
from pathlib import Path
from pdf_to_txt import convert

def test_text_pdf():
    # Create a simple PDF with text using pypdf
    from pypdf import PdfWriter
    pdf_path = Path(tempfile.gettempdir()) / "test_text.pdf"
    txt_path = pdf_path.with_suffix(".txt")
    writer = PdfWriter()
    writer.add_blank_page(width=72, height=72)
    with open(pdf_path, "wb") as f:
        writer.write(f)
    # Should produce an empty text file (blank page)
    convert(pdf_path, txt_path)
    assert txt_path.exists()
    content = txt_path.read_text(encoding="utf-8")
    assert "Page 1" in content
    txt_path.unlink()
    pdf_path.unlink()

def test_batch_and_stream_write():
    # Create two PDFs and test batch + stream_write
    from pypdf import PdfWriter
    pdf1 = Path(tempfile.gettempdir()) / "batch1.pdf"
    pdf2 = Path(tempfile.gettempdir()) / "batch2.pdf"
    txt1 = pdf1.with_suffix(".txt")
    txt2 = pdf2.with_suffix(".txt")
    for pdf in [pdf1, pdf2]:
        writer = PdfWriter()
        writer.add_blank_page(width=72, height=72)
        with open(pdf, "wb") as f:
            writer.write(f)
    # Use stream_write
    convert(pdf1, txt1, stream_write=True)
    convert(pdf2, txt2, stream_write=True)
    assert txt1.exists() and txt2.exists()
    for t in [txt1, txt2]:
        assert "Page 1" in t.read_text(encoding="utf-8")
        t.unlink()
    pdf1.unlink()
    pdf2.unlink()

def test_page_range():
    # Create a 3-page PDF and extract only page 2
    from pypdf import PdfWriter
    pdf_path = Path(tempfile.gettempdir()) / "range.pdf"
    txt_path = pdf_path.with_suffix(".txt")
    writer = PdfWriter()
    for _ in range(3):
        writer.add_blank_page(width=72, height=72)
    with open(pdf_path, "wb") as f:
        writer.write(f)
    convert(pdf_path, txt_path, page_range=(2,2))
    content = txt_path.read_text(encoding="utf-8")
    assert "Page 2" in content and "Page 1" not in content and "Page 3" not in content
    txt_path.unlink()
    pdf_path.unlink()

if __name__ == "__main__":
    test_text_pdf()
    test_batch_and_stream_write()
    test_page_range()
    print("All tests passed.")
