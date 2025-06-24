# Explicação dos Arquivos Dockerfile e Docker Compose

Este diretório contém exemplos com comentários explicativos sobre como usar Docker e Docker Compose para empacotar e rodar aplicações.

## 📌 Arquivos

### 🔹 `Dockerfile`

Arquivo que define como a imagem será construída:
- `FROM`: base da imagem
- `WORKDIR`: diretório padrão no container
- `COPY`: copia os arquivos locais
- `RUN`: instala dependências
- `CMD`: comando padrão ao rodar

### 🔹 `docker-compose.yml`

Arquivo que define e executa multi-containers:
- `version`: versão do schema do Compose
- `services`: lista de containers (serviços)
- `build`: caminho para o Dockerfile
- `volumes`: mapeamento local/container
- `command`: comando a executar no container

## ▶️ Como usar

1. Rode apenas com Docker Compose:
   ```bash
   docker-compose up --build
