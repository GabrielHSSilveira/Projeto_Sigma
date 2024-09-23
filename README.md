# Teste Sigma

Este projeto é um sistema para gerenciar produtos desenvolvido utilizando Django para o back-end e React para o front-end. A arquitetura do projeto é baseada em Docker, com PostgreSQL como banco de dados.

O sistema permite a **criação**, **leitura**, **atualização** e **exclusão** (CRUD) de produtos através de uma API REST, com uma interface de usuário interativa no front-end, conectada ao back-end Django. O projeto foi desenvolvido para ser facilmente configurado e implantado em contêineres Docker.

## Funcionalidades

- **CRUD de Produtos**: Criação, leitura, atualização e exclusão de produtos via API REST.
- **Integração Front-End e Back-End**: Front-end em React interagindo com o back-end Django por meio de API.
- **Deploy Dockerizado**: Aplicação pronta para ser executada em contêineres Docker.

---

## Requisitos

- **Docker**: Certifique-se de ter o Docker e Docker Compose instalados em sua máquina. Caso ainda não tenha, siga os tutoriais de instalação:
  - [Instalar Docker](https://docs.docker.com/get-docker/)
  - [Instalar Docker Compose](https://docs.docker.com/compose/install/)

---

## Tecnologias Utilizadas

- **Django**: Framework para o desenvolvimento do back-end.
- **React**: Biblioteca JavaScript para construção do front-end.
- **PostgreSQL**: Banco de dados relacional para armazenamento de dados.
- **Docker e Docker Compose**: Para criar e gerenciar contêineres de desenvolvimento.
  
---

## Configuração do Projeto

### 1. Clonar o Repositório

Clone o repositório do projeto na sua máquina local:

```bash
git clone https://github.com/seu-usuario/produto_project.git
cd produto_project
```
### 2. Configurar o Ambiente
Não é necessário instalar manualmente o ambiente Python ou dependências, já que o Docker gerencia esses contêineres para você.

Se necessário, certifique-se de ajustar as permissões de arquivo para rodar scripts:
```
chmod +x ./manage.py
```
### 3. Iniciar os Contêineres Docker

Suba o ambiente de desenvolvimento utilizando Docker Compose, com o seguinte comando:
```
docker-compose up --build
```
Este comando criará e inicializará os contêineres necessários (web e db) e começará a executar o projeto.

### 4. Configurar Banco de Dados

O projeto já está configurado para usar PostgreSQL. As credenciais padrão do banco de dados são:

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'db',
        'PORT': 5432,
    }
}

Essas configurações estão no arquivo settings.py. Se desejar, você pode modificar o nome do banco de dados, usuário ou senha.

Alterar Configuração no docker-compose.yml
Caso queira alterar as credenciais, também será necessário modificar o arquivo docker-compose.yml:

services:
  db:
    image: postgres
    environment:
      POSTGRES_DB: novo_banco
      POSTGRES_USER: novo_usuario
      POSTGRES_PASSWORD: nova_senha


Certifique-se de que as informações no settings.py e docker-compose.yml estejam em sincronia.

### 5. Migrar o Banco de Dados

Após configurar o banco, você precisará aplicar as migrações:
```
docker-compose exec web python manage.py migrate
```
### 6. Acessar o Projeto
Com o Docker Compose rodando, a aplicação estará disponível em http://localhost:8000 por padrão.

Para acessar o Django Admin, adicione /admin ao final da URL: http://localhost:8000/admin. Será necessário criar um superusuário:
```
docker-compose exec web python manage.py createsuperuser
```

### 7. Endpoints da API

A API está disponível no namespace /api/. Abaixo estão os principais endpoints:

- GET /api/produtos/: Retorna a lista de produtos.
- POST /api/produtos/: Cria um novo produto.
- GET /api/produtos/{id}/: Retorna detalhes de um produto específico.
- PUT /api/produtos/{id}/: Atualiza um produto existente.
- DELETE /api/produtos/{id}/: Exclui um produto.

### 8. Deploy

Build da Aplicação: 
  - Certifique-se de ter todos os contêineres criados, para isso utilize o seguinte comando:
```
docker-compose build
```
Deploy em Produção: 
  - Lembrar que para deploy em produção, deve ajustar o arquivo docker-compose.yml para usar o ambiente correto, como por exemplo definir DEBUG=False no arquivo de ambiente, ajustar o domínio e definir chaves de segurança. Após ajustar, rode o seguinte comando:
```
docker-compose up -d
```
### 9. Executar Testes Automatizados (Opcional)
Caso tenha testes implementados, você pode executá-los com o seguinte comando:

```
docker-compose exec web python manage.py test

```
### Notas

- **Portas:** certifique-se de verificar se todas as portas estão disponíveis antes de rodar os contêineres.
- **Permissões e Dependências:** caso tenha problemas com permissões ou dependências, consulte a documentação oficial do Django ou Docker.

Autor

- Gabriel Silveira - Desenvolvedor Backend.







