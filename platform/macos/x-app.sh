#!/bin/bash

soft=(
  "bottom" # 系统信息
  "s-tui"  # 系统信息
  "hey" # 压力测试
  "nvim" # 编辑器
  "ncdu" # 磁盘管理
  # "trashy" # 回收站
)

x install $(echo "${soft[*]}")

# x openai init 

