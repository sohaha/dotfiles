if [[ $OS_NAME = 'Linux' ]]; then
  source $SCRIPT_DIR/linux.sh
elif [[ $OS_NAME = 'Darwin' ]]; then
  export IS_MAC=1
  source $SCRIPT_DIR/mac.sh
fi

alias fv='nvim $(fzf)'
alias y='yazi'
