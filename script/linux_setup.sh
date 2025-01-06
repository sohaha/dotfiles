sudo -v

source platform/others/x-app.sh
source platform/linux/soft.sh



# 如果不存在 chsrc 命令
if ! command -v chsrc &> /dev/null; then
    curl https://chsrc.run/posix | sudo bash
fi
