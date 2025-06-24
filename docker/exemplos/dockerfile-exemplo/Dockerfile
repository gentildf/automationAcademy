#Imagem base: Python minimalista e leve.
FROM python:3.11-slim

#Define o diretório padrão de trabalho dentro do container.
WORKDIR /app

#Copia todos os arquivos do diretório atual para dentro do container.
COPY . .

#Instala a biblioteca requests
RUN pip install requests

#Comando padrão a ser executado quando o container iniciar.
CMD ["python", "app.py"]
