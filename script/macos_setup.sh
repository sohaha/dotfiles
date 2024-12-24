#!/bin/bash

source $HOME/dotfiles/script/utils.sh

# vimo
mkdir -p "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs"
link_file_hard "$HOME/dotfiles/config/vimo/VERSION" "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs/VERSION"
link_file_hard "$HOME/dotfiles/config/vimo/presets.db" "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs/presets.db"
link_file_hard "$HOME/dotfiles/config/vimo/userdata.db" "$HOME/Library/Containers/ChenghaoQ.Vimo-Rebinder/Data/Documents/Configs/userdata.db"

# aerospace
link_file "$HOME/dotfiles/config/aerospace/aerospace.toml" "$HOME/.aerospace.toml" 

# 随意拖拽
defaults write -g NSWindowShouldDragOnGesture -bool true
# 使用 F1-F12 键 作为功能键
defaults write -g com.apple.keyboard.fnState -bool true
# 全键盘切换
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# 禁止按键重复
defaults write -g ApplePressAndHoldEnabled -bool true
# 隐藏菜单栏
defaults write NSGlobalDomain _HIHideMenuBar -int 1
defaults write NSGlobalDomain AppleMenuBarVisibleInFullscreen -int 0
# 显示隐藏的应用程序图标
defaults write dock showhidden -bool true
# 显示所有文件的扩展名
defaults write finder AppleShowAllExtensions -bool true
# 显示文件的完整路径
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# 在 Finder 菜单中添加“退出”选项
defaults write finder FXEnableExtensionChangeWarning -bool true
defaults write com.apple.finder QuitMenuItem -bool true
# 修改 Dock 栏大小
defaults write com.apple.dock tilesize -int 20
# 不在桌面上显示硬盘
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
# 显示路径栏
defaults write com.apple.finder ShowPathbar -bool true
# 显示状态栏
defaults write com.apple.finder ShowStatusBar -bool true
# 默认打开当前目录
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
# 重启 Finder
killall Finder && killall Dock && killall SystemUIServer

source platform/macos/init.sh
source platform/others/x-app.sh
source platform/macos/brew.sh
source platform/macos/app.sh
