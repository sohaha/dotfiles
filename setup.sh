#!/bin/bash

# set -e

SCRIPT_DIR=$(dirname "$0")
OS_NAME=$(uname)

BACKUP_DIR=$HOME/.dotfiles_bak
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

source $SCRIPT_DIR/script/utils.sh

if [ -d "$HOME/.config" ]; then
  if [ -d "$HOME/.config" ] && [ ! -L "$HOME/.config" ]; then
    for file in $HOME/dotfiles/.config/*; do
      base_name=$(basename "$file")
      target="$HOME/.config/$base_name"
      link_file "$file" "$target"
    done
  fi
else
  ln -s "$HOME/dotfiles/.config" "$HOME"
  echo "已创建 $HOME/.config 的软链接"
fi

link_file "$HOME/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
link_file "$HOME/dotfiles/config/.gitconfig" "$HOME/.gitconfig"


if [ -z "$1" ]; then
  if [[ $OS_NAME = 'Linux' ]]; then
    source $SCRIPT_DIR/script/linux_setup.sh
  elif [[ $OS_NAME = 'Darwin' ]]; then
    source $SCRIPT_DIR/script/macos_setup.sh
  fi

  [ -d "$HOME/.fzf" ] || (git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && $HOME/.fzf/install)

  git clone --depth=1 https://github.com/ryanoasis/nerd-fonts $HOME/.config/nerd-fonts

  # git clone --depth=1 https://github.com/sohaha/nvim.git $HOME/.config/nvim

  if command -v chsrc &> /dev/null; then
    echo "chsrc is installed"
    # chsrc set go
    # chsrc set cargo
    # chsrc set npm
  fi
fi

