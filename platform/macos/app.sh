

soft=(
    "微信 https://mac.weixin.qq.com/"
    "搜狗输入法 https://shurufa.sogou.com/"
)

for item in "${soft[@]}"; do
    name=$(echo "$item" | cut -d' ' -f1)
    url=$(echo "$item" | cut -d' ' -f2)
    echo "$name: $url"
done

