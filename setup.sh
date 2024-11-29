#!/bin/bash

# set -e

SCRIPT_DIR=$(dirname "$0")
OS_NAME=$(uname)

BACKUP_DIR=$HOME/.dotfiles_bak
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

link_file() {
  local file=$1
  local target=$2
  local base_name=$(basename "$file")
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      backup_file="$BACKUP_DIR/${base_name}.backup.$(date +%Y%m%d%H%M%S)"
      mv "$target" "$backup_file"
      echo "已将现有的 $target 备份为 $backup_file"
      ln -s "$file" "$target"
      echo "$file -> $target"
    else
      echo "跳过 $target"
    fi
  else
    ln -s "$file" "$target"
    echo "$file -> $target"
  fi
}

is_hardlink() {
    local file="$1"
    local link_count
    if [[ "$(uname)" == "Darwin" ]]; then
        link_count=$(stat -f "%l" "$file")
    else
        link_count=$(stat -c "%h" "$file")
    fi
    
    if [ "$link_count" -gt 1 ]; then
        return 0
    else
        return 1
    fi
}

link_file_hard() {
  local file=$1
  local target=$2
  local base_name=$(basename "$file")
  if [ -e "$target" ]; then
    if ! is_hardlink "$target"; then
      backup_file="$BACKUP_DIR/${base_name}.backup.$(date +%Y%m%d%H%M%S)"
      mv "$target" "$backup_file"
      echo "已将现有的 $target 备份为 $backup_file"
      ln "$file" "$target"
      echo "$file -> $target"
    else
      echo "跳过 $target"
    fi
  else
    ln "$file" "$target"
    echo "$file -> $target"
  fi
}

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

