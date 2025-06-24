O que esse script faz, explicado em call:
Cria uma função chamada listar_imports.

A função percorre todos os arquivos .tf dentro de um diretório (incluindo subpastas de qualquer nível).

Para cada arquivo .tf, ele lê a última linha.

Se a última linha começar com # terraform, considera que é um comentário com comando de import.

Remove o # e salva:

O caminho completo do arquivo onde o comando foi encontrado (com # na frente);

O comando terraform import, formatado corretamente.

Gera tudo em um arquivo lista_imports.txt.