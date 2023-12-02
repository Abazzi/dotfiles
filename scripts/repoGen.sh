#!/bin/bash

while getopts "b:w:t:" opt; do
  case $opt in
    t)
      i="$OPTARG"
      echo "Generating Webpack Repo With Sass & TypeScript" | lolcat
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/assets/favicon.ico favicon.ico
      cp ~/dotfiles/gitconfig/.gitignore .gitignore
      cp ~/dotfiles/otherConfigs/.prettierrc.json .prettierrc.json

      ## Create starter files
      touch index.html main.ts styles.scss

      ## initalize git repo and install eslint, prettier, webpack with sass
      #& typescript
      git init
      npm init -y
      npm install prettier eslint-config-prettier webpack webpack-cli sass sass-loader style-loader typescript ts-loader webpack-dev-server --save-dev
      npm init @eslint/config
      echo "Project Setup Finished" | lolcat
      ;;
    w)
      i="$OPTARG"
      echo "Generating Webpack Repo" | lolcat
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/assets/favicon.ico favicon.ico
      cp ~/dotfiles/gitconfig/.gitignore .gitignore
      cp ~/dotfiles/otherConfigs/.prettierrc.json .prettierrc.json

      ## Create starter files
      touch index.html main.js styles.css

      ## initalize git repo and install eslint, prettier, webpack and babel
      git init
      npm init -y
      npm install prettier eslint-config-prettier webpack webpack-cli webpack-dev-server babel-loader @babel/core @babel/preset-env --save-dev
      npm init @eslint/config
      echo "Project Setup Finished" | lolcat
      ;;
    b)
      i="$OPTARG"
      echo "Generating Bare Repo" | lolcat
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/assets/favicon.ico favicon.ico
      cp ~/dotfiles/gitconfig/.gitignore .gitignore
      cp ~/dotfiles/otherConfigs/.prettierrc.json .prettierrc.json

      ## Create starter files
      touch index.html main.js styles.css

      ## initalize git repo and install eslint, prettier
      git init
      npm init -y
      npm install -d prettier eslint-config-prettier --save-dev
      npm init @eslint/config
      echo "Project Setup Finished" | lolcat
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

