#!/bin/bash

# set -e

# symlinks
[ -d "$HOME/.config" ] && ln -s $HOME/dotfiles/.config/* $HOME/.config || ln -s $HOME/dotfiles/.config $HOME
[ -f "$HOME/.tmux.conf" ] || ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

[ -d "$HOME/.fzf" ] || (git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && $HOME/.fzf/install)
