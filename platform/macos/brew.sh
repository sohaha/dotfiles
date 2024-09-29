#!/bin/bash

# 软件列表
soft=(
    "pearcleaner"    # 清理
    "hammerspoon"    # 脚本控制
    "keyboardholder" # 键盘映射
    "monitorcontrol" # 显示器亮度控制
)

# 安装软件
for item in "${soft[@]}"
do
    brew install "$item"
done

