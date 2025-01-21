if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

if command -v pay-respects &> /dev/null; then
    eval "$(pay-respects zsh --alias)"
fi