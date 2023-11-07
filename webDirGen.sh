#!/bin/bash

mkdir $1

cd $1

## Copy Favicon, gitignore and prettier config 
cp ~/dotfiles/favicon.ico favicon.ico
cp ~/dotfiles/.gitignore .gitignore
cp ~/dotfiles/.prettierrc .prettierrc

## Create starter files
touch index.html main.js styles.css

## initalize git repo and install eslint and prettier
git init
npm init -y
npm install -d eslint prettier eslint-config-prettier
