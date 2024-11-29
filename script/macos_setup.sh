
# vimo
mkdir -p "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs"
link_file_hard "$HOME/dotfiles/config/vimo/VERSION" "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs/VERSION"
link_file_hard "$HOME/dotfiles/config/vimo/presets.db" "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs/presets.db"
link_file_hard "$HOME/dotfiles/config/vimo/userdata.db" "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs/userdata.db"

source platform/macos/init.sh
source platform/macos/x-app.sh
source platform/macos/app.sh