# Use a imagem base do Python
FROM python:3.11

# Defina o diretório de trabalho no container
WORKDIR /app

# Copie o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instale as dependências listadas no requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copie o restante dos arquivos e diretórios para o diretório de trabalho
COPY . .

# Exponha a porta em que a aplicação Django vai rodar
EXPOSE 8000

# Defina o comando que será executado ao iniciar o container
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app.wsgi:application"]
