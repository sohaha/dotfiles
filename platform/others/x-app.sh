#!/bin/bash

eval "$(curl https://get.x-cmd.com)"

# # 可能需要安装 zstd: sudo apt-get install zstd 
curl -sSfL https://raw.githubusercontent.com/iffse/pay-respects/main/install.sh | sh > /dev/null 2>&1

soft=(
  "bottom"     # 系统信息
  "s-tui"      # 系统信息
  # "hey"        # 压力测试
  "nvim"       # 编辑器
  "ncdu"       # 磁盘管理
  "zoxide"     # 命令历史
  # "oha"        # 负载测试
  # "trashy"   # 回收站
  "gomi"       # 回收站
  "kondo"      # 开发依赖清理
)

echo "======================= 手动安装 x-cmd 命令 ========================="
for app in "${soft[@]}"; do
  echo "x install $app"
done
echo "===================================================================="
# x openai init 

