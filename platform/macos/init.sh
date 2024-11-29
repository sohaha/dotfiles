chsh -s $(which zsh)

defaults write -g com.apple.keyboard.fnState -bool true

/bin/bash -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/ineo6/homebrew-install/install)"

eval "$(curl https://get.x-cmd.com)"

curl -sSf https://raw.githubusercontent.com/owenthereal/goup/master/install.sh | sh -s -- '--skip-prompt'

