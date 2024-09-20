current_shell=$(if [ -n "$BASH_VERSION" ]; then echo "bash"; elif [ -n "$ZSH_VERSION" ]; then echo "zsh"; else echo "unknown"; fi)
current_script_dir=$(dirname "$0")

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR


# FZF
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgreprc
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview ""' # disable FZF preview
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
if [ -f "$HOME/.fzf.bash" ]; then
  if [ "$my_shell" = "zsh" ]; then
    source "$HOME/.fzf.bash"
  else
    source "$HOME/.fzf.zsh"
  fi
fi



source "$current_script_dir/alias.sh"