echo "Destruindo os containers do n8n (sem apagar dados persistentes)..."
docker-compose down --remove-orphans

# O script não apaga o conteúdo do diretório data/. Isso mantém os workflows, credenciais e histórico salvos.