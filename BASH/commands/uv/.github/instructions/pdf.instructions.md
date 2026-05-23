---
name: pdf
description: "Use when: working with PDF reading, extraction, merging, splitting, or manipulation. Enforce library selection, code style, and memory-efficient patterns for PDF operations."
applyTo: "**/*.py"
---

# PDF Processing Instructions

When working with PDF files in Python, follow these guidelines to ensure consistent, performant, and maintainable code.

## Library Preferences

### Primary Libraries (in order of preference)

1. **pypdf** — Use for most operations
   - Merge, split, rotate, and manipulate PDF pages
   - Extract text and metadata
   - Works well with in-memory operations
   - **When to use:** General-purpose PDF tasks, batch operations on standard PDFs

2. **pdfplumber** — Use for complex text/table extraction
   - Superior table extraction and positional accuracy
   - Better text extraction with layout preservation
   - **When to use:** Data extraction, reading forms, analyzing structured documents

3. **reportlab** — Use for PDF generation
   - Create PDFs from scratch
   - Build layouts and graphics programmatically
   - **When to use:** Generating reports, creating forms, drawing custom content

4. **PyPDF2** — Avoid unless legacy code requires it
   - Older, less maintained than pypdf
   - pypdf is a continuation of the PyPDF2 project

### Library-Specific Best Practices

**pypdf:**
```python
from pypdf import PdfReader, PdfWriter

# Use context manager or explicit cleanup for large files
reader = PdfReader("large.pdf")
try:
    # Process pages
finally:
    reader.stream.close()
```

**pdfplumber:**
```python
import pdfplumber

# Always use context manager for automatic resource cleanup
with pdfplumber.open("document.pdf") as pdf:
    for i, page in enumerate(pdf.pages):
        tables = page.extract_tables()
```

## Code Style

### Structure and Naming

- **Function naming:** Use verb-first names: `extract_text()`, `merge_pdfs()`, `split_by_page()`
- **Variable naming:** Use descriptive names: `input_reader`, `output_writer`, `page_count`
- **Avoid:** Ambiguous names like `pdf`, `file`, `data` (unless very local scope)

### Error Handling

Always validate PDF files before processing:
```python
from pypdf import PdfReader

def safe_read_pdf(filepath):
    try:
        reader = PdfReader(filepath)
        # Validate the file is readable
        _ = len(reader.pages)
        return reader
    except Exception as e:
        raise ValueError(f"Invalid PDF: {filepath}") from e
```

### Resource Management

Always close readers and writers explicitly or use context managers:
```python
# Good: Explicit close
reader = PdfReader("input.pdf")
try:
    # Process
finally:
    reader.stream.close()

# Better: Context manager (if available)
with pdfplumber.open("input.pdf") as pdf:
    # Process
```

## Performance & Memory Efficiency

### Guidelines

1. **Stream large files** — Don't load entire PDFs into memory if processing page-by-page
   ```python
   # Good: Process one page at a time
   reader = PdfReader("large.pdf")
   for page in reader.pages:
       text = page.extract_text()
       # Process and discard
   ```

2. **Batch operations** — Group writes to minimize I/O
   ```python
   # Good: Write once after processing all pages
   writer = PdfWriter()
   for filepath in many_pdfs:
       reader = PdfReader(filepath)
       writer.add_pages(reader.pages)
   writer.write("output.pdf")
   reader.stream.close()
   ```

3. **Avoid duplication** — Don't re-read the same PDF multiple times
   ```python
   # Bad
   reader = PdfReader("doc.pdf")
   text = extract_all_text(reader)
   # ...later
   reader = PdfReader("doc.pdf")  # Re-opened unnecessarily
   
   # Good: Reuse the reader
   reader = PdfReader("doc.pdf")
   text = extract_all_text(reader)
   metadata = extract_metadata(reader)  # Reuse
   ```

4. **Release resources early** — Close readers you're done with
   ```python
   reader1 = PdfReader("doc1.pdf")
   process(reader1)
   reader1.stream.close()  # Release before processing next file
   
   reader2 = PdfReader("doc2.pdf")
   process(reader2)
   reader2.stream.close()
   ```

### Memory Limits

- For PDFs **< 10 MB**: Load entire file into memory (safe)
- For PDFs **10-100 MB**: Process page-by-page or use streaming
- For PDFs **> 100 MB**: Implement chunked processing or split into smaller batches

## Referencing SKILL.md

For detailed code examples, advanced operations (encryption, forms, OCR, JavaScript), and command-line tools, see `IDE/skills/skills-main/skills/pdf/SKILL.md`.
