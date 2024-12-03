chsh -s $(which zsh)

sudo spctl --master-disable

defaults write -g com.apple.keyboard.fnState -bool true

/bin/bash -c "$(curl -fsSL https://gitee.com/ineo6/homebrew-install/raw/master/install.sh)"

eval "$(curl https://get.x-cmd.com)"

curl -sSf https://raw.githubusercontent.com/owenthereal/goup/master/install.sh | sh -s -- '--skip-prompt'

