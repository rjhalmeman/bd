#!/bin/bash

# Nome padrão do repositório remoto
default_remote="https://github.com/rjhalmeman/bd"

# Verifica se o git está instalado
if ! command -v git &> /dev/null
then
    echo "O Git não está instalado. Por favor, instale o Git antes de continuar."
    exit
fi

# Adiciona todas as alterações ao índice do Git
git add .

# Obtém a data e hora atual e formata para o formato desejado (por exemplo, YYYY-MM-DD HH:MM:SS)
timestamp=$(date +"%d/%m/%Y - %H:%M:%S")

# Realiza um commit com a mensagem contendo a data e hora
git commit -m "$timestamp"

# Verifica se um argumento foi fornecido
if [ $# -eq 0 ]; then
    # Faz o push para o repositório remoto padrão no GitHub
    git push "$default_remote"
else
    # Faz o push para o repositório remoto fornecido no GitHub
    git push "$1""$default_remote"
fi

