# Desafio 1: Criando sua primeira imagem com Docker

## Objetivo

Rodar um container que executa um script Python simples que consome a [PokeAPI](https://pokeapi.co).

## Instruções

1. Abra o terminal na pasta deste desafio.
2. Construa a imagem: ´docker build -t desafio-pokeapi . ´
3. Rode o container: ´docker run desafio-pokeapi´

4. (Opcional) Para inspecionar sua imagem e container que colocou pra rodar, voce pode usar:
    ´docker image ls´  -> Lista as imagens baixadas
    ´docker container ls -a´ lista todos os containers criados