dir = '/home/me/Notebooks/AI'
prog = f'{dir}/skills/pdf_to_txt.py'
fro = '/media/me/H500/T5/RULES'
to = f'{dir}/T5-books'

Book1 = 'T5 dot 10 Core Rules Book 1.pdf'
Book2 = 'T5 dot 10 Core Rules Book 2.pdf'
Book3 = 'T5 dot 10 Core Rules Book 3.pdf'
#Book4 = 'T5 dot 10 Core Rule Books.pdf'

Out1 = 'T5-1-Characters.txt'
Out2 = 'T5-2-Ships.txt'
Out3 = 'T5-3-Worlds.txt'
#Out4 = 'T5-Combined.txt'

print(f"cd /home/me/Notebooks/AI")

print(f"python {prog} -o '{to}/{Out1}' '{fro}/{Book1}'")

print(f"python {prog} -o '{to}/{Out2}' '{fro}/{Book2}'")

print(f"python {prog} -o '{to}/{Out3}' '{fro}/{Book3}'")

#print(f"python {prog} -o '{to}/{Out4}' '{fro}/{Book4}'")
