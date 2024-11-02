#!/bin/bash

# 软件列表
soft=(
  "pearcleaner"        # 清理
  "hammerspoon"        # 脚本控制
  "keyboardholder"     # 输入法切换
  "monitorcontrol"     # 显示器亮度控制
  "wezterm"            # 终端
  "maccy"              # 剪切板管理
  "neovim"             # NVIM 编辑器
  "lulu"               # 防火墙
  "battery"            # 电池
  "karabiner-elements" # 键盘映射
  "phoenix"            # 脚本控制
  "responsively"       # 自适应开发环境
  "snipaste"           # 截图
  "utools"             # utools
  "lazygit"            # GIT UI
  "chsrc"              # 切换源
  "mac-cleanup-py"     # 自动清理
  "zen-browser"        # Zen Browser
)

# 安装软件
for item in "${soft[@]}"; do
  brew install "$item"
done
