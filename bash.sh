current_shell=$(if [ -n "$BASH_VERSION" ]; then echo "bash"; elif [ -n "$ZSH_VERSION" ]; then echo "zsh"; else echo "unknown"; fi)
current_script_dir=$HOME/dotfiles/script
OS_NAME=$(uname)

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR


# fzf
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgreprc
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview ""' # disable FZF preview
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

if [ "$current_shell" = "zsh" ]; then
  if [ -f "$HOME/.fzf.zsh" ]; then
    source "$HOME/.fzf.zsh"
  fi
  else
    if [ -f "$HOME/.fzf.bash" ]; then
      source "$HOME/.fzf.bash"
    fi
fi

if [ -f "$HOME/.env" ]; then
  source "$HOME/.env"
fi

# direnv
# if ! command -v direnv &> /dev/null; then
#     export bin_path=~/.local/bin
#     curl -sfL https://direnv.net/install.sh | bash
# fi
# [ -x "$(command -v direnv)" ] && eval "$(direnv hook $current_shell)"

export PATH=$HOME/.go/current/bin:$HOME/.go/bin:$HOME/.go:$HOME/go/bin:$HOME/bin:$HOME/.bun/bin:$PATH

source "$current_script_dir/alias.sh"

if [ "$current_shell" = "zsh" ]; then
  source $current_script_dir/zsh_alias.sh
else
    source $current_script_dir/bash_alias.sh
fi


if [[ $OS_NAME = 'Linux' ]]; then
  source $current_script_dir/linux_alias.sh
elif [[ $OS_NAME = 'Darwin' ]]; then
  export IS_MAC=1
  source $current_script_dir/macos_alias.sh
fi
