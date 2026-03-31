from fpdf import FPDF

with open("/home/me/Notebooks/markdown_instructions_and_example.md", encoding="utf-8") as f:
    lines = f.readlines()

pdf = FPDF()
pdf.add_page()
pdf.set_font("Arial", size=12)

for line in lines:
    pdf.multi_cell(0, 10, line)

pdf.output("/home/me/Notebooks/markdown_instructions_and_example.pdf")
