#!/bin/bash

while getopts "b:w:" opt; do
  case $opt in
    w)
      i="$OPTARG"
      echo "Generating Webpack Repo" | lolcat
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/favicon.ico favicon.ico
      cp ~/dotfiles/.gitignore .gitignore
      cp ~/dotfiles/.prettierrc .prettierrc

      ## Create starter files
      touch index.html main.ts styles.scss

      ## initalize git repo and install eslint, prettier, webpack with sass
      #& typescript
      git init
      npm init -y
      npm install -d eslint prettier eslint-config-prettier webpack webpack-cli sass sass-loader style-loader typescript ts-loader
      echo "Basic Directory Setup Finished" | lolcat
      ;;
    b)
      i="$OPTARG"
      echo "Generating Bare Repo" | lolcat
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/favicon.ico favicon.ico
      cp ~/dotfiles/.gitignore .gitignore
      cp ~/dotfiles/.prettierrc .prettierrc

      ## Create starter files
      touch index.html main.ts styles.scss

      ## initalize git repo and install eslint, prettier
      git init
      npm init -y
      npm install -d eslint prettier eslint-config-prettier
      echo "Bare Repo Setup Finished" | lolcat
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires na argument" >&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

