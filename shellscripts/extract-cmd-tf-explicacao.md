# 🔍 Script: listar_imports.sh

Este script percorre todos os arquivos `.tf` dentro de um diretório e suas subpastas, buscando **comandos `terraform import` comentados** na **última linha** de cada arquivo. Esses comandos são extraídos e organizados em um arquivo de saída.

---

## ✅ Objetivo

Automatizar a coleta de comandos `terraform import` que foram deixados como comentários no final dos arquivos `.tf`, gerando uma lista clara e pronta para execução ou revisão.

---

## 🧠 Como funciona

1. O script entra no diretório especificado (ou no diretório atual, por padrão).
2. Encontra todos os arquivos `.tf` dentro desse diretório e de **todas as subpastas**.
3. Para cada arquivo `.tf`:
   - Lê a **última linha do arquivo**;
   - Se essa linha começar com `# terraform`, interpreta como um comando válido;
   - Remove o `#` e salva o caminho do arquivo e o comando em um arquivo de saída.

---

## 📝 Exemplo de uso

```bash
chmod +x listar_imports.sh
./listar_imports.sh /caminho/do/diretorio
