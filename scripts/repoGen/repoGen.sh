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
      cp ~/dotfiles/scripts/repoGen/.prettierrc.json .prettierrc.json
      cp ~/dotfiles/scripts/repoGen/tsconfig.json tsconfig.json
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withTypescript/webpack.production.js webpack.production.js 
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withTypescript/webpack.dev.js webpack.dev.js 
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withTypescript/webpack.common.js webpack.common.js 

      ## Create starter files
      mkdir src
      cd src
      touch index.html main.ts styles.scss 
      cd ..

      ## initalize git repo and install eslint, prettier, webpack with sass
      #& typescript
      npm init -y
      npm install prettier eslint-config-prettier  \
        sass sass-loader style-loader css-loader css-minimizer-webpack-plugin\
        html-webpack-plugin\
        typescript ts-loader webpack-dev-server webpack-merge webpack webpack-cli\
        file-loader --save-dev
      npm install --save clean-webpack-plugin
      npm init @eslint/config
      echo "Project Setup Finished" | lolcat
      ;;
    w)
      i="$OPTARG"
      echo "Generating Webpack with Babel Repo" | lolcat
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/assets/favicon.ico favicon.ico
      cp ~/dotfiles/gitconfig/.gitignore .gitignore
      cp ~/dotfiles/scripts/repoGen/.prettierrc.json .prettierrc.json
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withBabel/webpack.production.js webpack.production.js 
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withBabel/webpack.dev.js webpack.dev.js 
      cp ~/dotfiles/scripts/repoGen/webpackConfigs/withBabel/webpack.common.js webpack.common.js 

      ## Create starter files
      mkdir src
      cd src
      touch index.html index.js styles.scss
      cd ..

      ## initalize git repo and install eslint, prettier, webpack and babel
      npm init -y
      npm install prettier eslint-config-prettier  \
        sass sass-loader style-loader css-loader css-minimizer-webpack-plugin\
        html-webpack-plugin\
        babel-loader @babel/core @babel/preset-env \
        webpack-dev-server webpack-merge webpack webpack-cli\
        file-loader --save-dev
      npm install --save clean-webpack-plugin
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

