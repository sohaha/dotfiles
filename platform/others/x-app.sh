#!/bin/bash

soft=(
  "bottom"     # 系统信息
  "s-tui"      # 系统信息
  "hey"        # 压力测试
  "nvim"       # 编辑器
  "ncdu"       # 磁盘管理
  "zoxide"     # 命令历史
  # "trashy"   # 回收站
)

for app in "${soft[@]}"; do
  x install "$app" || echo "Failed to install $app"
done

# x openai init 

