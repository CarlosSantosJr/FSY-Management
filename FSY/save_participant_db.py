import PyPDF2

pdf_file = open('Companhias FSY 2023.pdf', 'rb')

pdf_reader = PyPDF2.PdfReader(pdf_file)

new_company = False

print(len(pdf_reader.pages))
for page in pdf_reader.pages:
    text = page.extract_text()
    print(text)
    break



pdf_file.close()