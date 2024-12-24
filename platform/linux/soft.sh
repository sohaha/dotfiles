#!/bin/bash

# set -e

chsh -s $(which zsh)

# 安装
function install() {
  echo "install $1"
}

# 切换源
curl -L https://gitee.com/RubyMetric/chsrc/releases/download/pre/chsrc-x64-linux -o chsrc
chmod +x chsrc
sudo mv chsrc ~/bin/
