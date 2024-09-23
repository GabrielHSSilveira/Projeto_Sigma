# Usar uma imagem oficial do Python
FROM python:3.12

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o arquivo requirements.txt para instalar as dependências
COPY requirements.txt .

# Instalar as dependências do projeto
RUN pip install -r requirements.txt

# Copiar o restante do código para dentro do contêiner
COPY . .

# Definir uma variável de ambiente para o Python não usar buffering 
ENV PYTHONUNBUFFERED 1

# Comando para rodar o Django quando o contêiner for iniciado
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
