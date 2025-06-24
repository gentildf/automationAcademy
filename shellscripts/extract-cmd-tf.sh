#!/bin/bash

# Função que busca comandos de terraform import em arquivos .tf
listar_imports() {
  # Primeiro argumento: diretório base (default: diretório atual)
  local BASE_DIR="$1"

  # Segundo argumento: nome do arquivo de saída (default: lista_imports.txt)
  local OUTPUT_FILE="${2:-lista_imports.txt}"

  # Cria ou limpa o arquivo de saída
  > "$OUTPUT_FILE"

  # Procura todos os arquivos com extensão .tf no diretório e subdiretórios
  find "$BASE_DIR" -type f -name "*.tf" | while read -r FILE; do
    # Pega a última linha do arquivo
    LAST_LINE=$(tail -n 1 "$FILE")

    # Verifica se a linha começa com "# terraform"
    if [[ "$LAST_LINE" == \#\ terraform* ]]; then
      # Remove o "#" do começo da linha
      COMANDO=${LAST_LINE#\# }

      # Escreve no arquivo de saída:
      # - o caminho do arquivo (com prefixo "#")
      # - o comando terraform encontrado
      {
        echo "# $FILE"
        echo "$COMANDO"
        echo
      } >> "$OUTPUT_FILE"
    fi
  done

  # Informa o local onde o resultado foi salvo
  echo "Arquivo gerado em: $OUTPUT_FILE"
}

# Executa a função, usando o diretório atual como base por padrão
listar_imports "./"
