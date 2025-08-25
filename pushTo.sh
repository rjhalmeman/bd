#!/bin/bash

# Obtém o nome da pasta atual
current_folder=$(basename "$PWD")

# Nome do remote (não a URL)
remote_name="origin"
# Nome do branch (ajuste conforme necessário)
branch_name="main"

clear
git status
echo ""
echo "Remote: $remote_name"
echo "Branch: $branch_name"
echo

# Verifica se o git está instalado
if ! command -v git &> /dev/null
then
    echo "O Git não está instalado. Por favor, instale o Git antes de continuar."
    exit
fi

# Verifica se o remote existe, se não, adiciona
if ! git remote get-url "$remote_name" &> /dev/null; then
    default_remote="https://github.com/rjhalmeman/$current_folder"
    echo "Adicionando remote: $remote_name -> $default_remote"
    git remote add "$remote_name" "$default_remote"
fi

# Adiciona todas as alterações ao índice do Git
git add .

# Obtém a data e hora atual
timestamp=$(date +"%d/%m/%Y - %H:%M:%S")

# Verifica se foi fornecido um parâmetro adicional para a mensagem de commit
if [ $# -eq 0 ]; then
    commit_message="$timestamp"
else
    commit_message="$timestamp - $*"
fi

# Realiza um commit com a mensagem
git commit -m "$commit_message"

# Faz o push para o repositório remoto
git push "$remote_name" "$branch_name"