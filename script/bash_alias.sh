if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi

if command -v pay-respects &> /dev/null; then
    eval "$(pay-respects bash --alias)"
fi