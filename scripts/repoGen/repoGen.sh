#!/bin/bash

repoGenTitle=$'
 ▄▀▀▄▀▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀▄▀▀▀▄  ▄▀▀▀▀▄   ▄▀▀▀▀▄   ▄▀▀█▄▄▄▄  ▄▀▀▄ ▀▄  ▄▀▀▀▀▄  ▄▀▀▄ ▄▄  
█   █   █ ▐  ▄▀   ▐ █   █   █ █      █ █        ▐  ▄▀   ▐ █  █ █ █ █ █   ▐ █  █   ▄▀ 
▐  █▀▀█▀    █▄▄▄▄▄  ▐  █▀▀▀▀  █      █ █    ▀▄▄   █▄▄▄▄▄  ▐  █  ▀█    ▀▄   ▐  █▄▄▄█  
 ▄▀    █    █    ▌     █      ▀▄    ▄▀ █     █ █  █    ▌    █   █  ▀▄   █     █   █  
█     █    ▄▀▄▄▄▄    ▄▀         ▀▀▀▀   ▐▀▄▄▄▄▀ ▐ ▄▀▄▄▄▄   ▄▀   █ ▄  █▀▀▀     ▄▀  ▄▀  
▐     ▐    █    ▐   █                  ▐         █    ▐   █    ▐    ▐       █   █    
           ▐        ▐                            ▐        ▐                 ▐   ▐    '

while getopts "b:w:t:d" opt; do
  case $opt in
    s)
      i="$OPTARG"
      echo "$repoGenTitle" | lolcat
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/assets/favicon.ico favicon.ico
      cp ~/dotfiles/gitconfig/.gitignore .gitignore
      cp ~/dotfiles/scripts/repoGen/.prettierrc.toml .prettierrc.toml
      cp ~/dotfiles/scripts/repoGen/.eslintrc.json .eslintrc.json 
      cp ~/dotfiles/scripts/repoGen/tsconfig.json tsconfig.json
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withTypescript/webpack.production.js webpack.production.js 
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withTypescript/webpack.dev.js webpack.dev.js 
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withTypescript/webpack.common.js webpack.common.js 

      ## Create starter files
      mkdir src
      cd src
      mkdir templates ts scss
      cd templates 
      touch index.html
      cd ../
      cd ts
      touch index.ts styles.scss 
      cd ..

      ## initalize git repo and install eslint, prettier, webpack with sass
      #& typescript
      npm init -y
      npm install prettier eslint-config-prettier  \
        sass sass-loader style-loader css-loader css-minimizer-webpack-plugin\
        html-webpack-plugin\
        typescript ts-loader webpack-dev-server webpack webpack-cli\
        file-loader\
        @typescript-eslint/eslint-plugin @typescript-eslint/parser \
        --save-dev
      npm install --save clean-webpack-plugin
      echo "$i Repo Generated" | lolcat
      ;;
    b)
      i="$OPTARG"
      echo "Generating Bare Repo" | lolcat
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/assets/favicon.ico favicon.ico
      cp ~/dotfiles/gitconfig/.gitignore .gitignore
      cp ~/dotfiles/scripts/repoGen/.prettierrc.json .prettierrc.json

      ## Create starter files
      mkdir src
      cd src
      touch index.html index.js styles.scss
      cd ..

      ## initalize git repo and install eslint, prettier
      npm init -y
      npm install -d prettier eslint-config-prettier --save-dev
      npm init @eslint/config
      echo "$i Repo Generated" | lolcat
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires na argument" >&2
      exit 1
      ;;
    t)
      i="$OPTARG"
      echo "$repoGenTitle" | lolcat
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/assets/favicon.ico favicon.ico
      cp ~/dotfiles/gitconfig/.gitignore .gitignore
      cp ~/dotfiles/scripts/repoGen/.prettierrc.toml .prettierrc.toml
      cp ~/dotfiles/scripts/repoGen/.eslintrc.json .eslintrc.json 
      cp ~/dotfiles/scripts/repoGen/tsconfig.json tsconfig.json
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withTypescript/webpack.production.js webpack.production.js 
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withTypescript/webpack.dev.js webpack.dev.js 
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withTypescript/webpack.common.js webpack.common.js 

      ## Create starter files
      mkdir src
      cd src
      mkdir templates ts css
      cd templates 
      touch index.html
      cd ../
      cd ts
      touch index.ts 
      cd ../
      cd css/
      touch styles.css 
      cd ..

      ## initalize git repo and install eslint, prettier, webpack 
      #& typescript
      npm init -y
      npm install prettier eslint-config-prettier  \
        style-loader css-loader css-minimizer-webpack-plugin\
        html-webpack-plugin\
        typescript ts-loader webpack-dev-server webpack webpack-cli\
        file-loader\
        @typescript-eslint/eslint-plugin @typescript-eslint/parser \
        --save-dev
      npm install --save clean-webpack-plugin
      echo "$i Repo Generated" | lolcat
      ;;
  esac
done
shift $((OPTIND -1))

