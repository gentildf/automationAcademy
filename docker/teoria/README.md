
# Fundamentos do Docker

> 📚 Este conteúdo faz parte do módulo de Docker do repositório [automationAcademy](https://github.com/gentildf/automationAcademy).

## O que é Docker?

Docker é uma ferramenta que permite empacotar aplicações e suas dependências em **containers**, que são leves, portáteis e executam de forma isolada.

---

## Conceitos Básicos

- **Imagem**: modelo pronto com tudo que sua aplicação precisa.
- **Container**: instância de uma imagem em execução.
- **Dockerfile**: arquivo que define como construir uma imagem.
- **Docker CLI**: comandos para controlar imagens, containers, volumes e redes.

---

## Comandos Essenciais

```bash
# Verificar se o Docker está funcionando
docker version

# Ver imagens locais
docker images

# Rodar um container
docker run hello-world

# Construir imagem a partir de um Dockerfile
docker build -t minha-imagem .

# Listar containers em execução
docker ps

# Listar todos os containers (ativos ou não)
docker ps -a

# Parar e remover container
docker stop nome_ou_id
docker rm nome_ou_id
```

---

## Portas e Volumes

```bash
# Mapear porta local para o container
docker run -p 8080:80 nginx

# Mapear volume local
docker run -v $(pwd):/app minha-imagem
```

---

## Dockerfile Básico

```Dockerfile
FROM python:3.11-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
```

---

## Docker Compose Básico

```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - .:/app
```

Rode com:

```bash
docker-compose up --build
```

---

## Pratique Agora

👉 Vá até o diretório [`exemplos/`](../exemplos/) para ver na prática.

👉 Depois, tente resolver os desafios em [`desafios/`](../desafios/).

---

## Dica Final

Foque em **entender com prática**. Rode comandos, quebre coisas, refaça. Quanto mais você testar, mais claro tudo vai ficar.
