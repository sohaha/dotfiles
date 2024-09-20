#!/bin/bash

# set -e

BACKUP_DIR=$HOME/.dotfiles_bak
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi


[ -d "$HOME/.config" ] && ln -s $HOME/dotfiles/.config/* $HOME/.config || ln -s $HOME/dotfiles/.config $HOME

ln_tmux() {
    local TMUX_CONF="$HOME/.tmux.conf"
    TMUX_CONF="$HOME/.tmux.conf"
    if [ -f "$TMUX_CONF" ]; then
        backup_file="$BACKUP_DIR/.tmux.conf.backup.$(date +%Y%m%d%H%M%S)"
        mv "$TMUX_CONF" "$backup_file"
        echo "已将现有的 .tmux.conf 备份为 $backup_file"
    fi

    ln -s "$HOME/dotfiles/.tmux.conf" "$TMUX_CONF"
    echo "已创建新的 .tmux.conf 软链接"
}
ln_tmux


[ -d "$HOME/.fzf" ] || (git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && $HOME/.fzf/install)
