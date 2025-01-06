#!/bin/bash

# set -e

# 如果不存在 zsh
if ! command -v zsh &> /dev/null; then
   x install zsh
fi


chsh -s $(which zsh)

function install() {
  if command -v apt-get &> /dev/null; then
    sudo apt-get install $1
  elif command -v yum &> /dev/null; then
    sudo yum install $1
  fi
}

soft=(
  "ripgrep"
)

for item in "${soft[@]}"; do
  install "$item"
done
