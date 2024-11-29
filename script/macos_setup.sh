
# vimo
mkdir -p "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs"
link_file_hard "$HOME/dotfiles/config/vimo/VERSION" "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs/VERSION"
link_file_hard "$HOME/dotfiles/config/vimo/presets.db" "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs/presets.db"
link_file_hard "$HOME/dotfiles/config/vimo/userdata.db" "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs/userdata.db"

# 使用 F1-F12 键 作为功能键
defaults write -g com.apple.keyboard.fnState -bool true

source platform/macos/init.sh
source platform/macos/x-app.sh
source platform/macos/app.sh