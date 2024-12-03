
soft=(
    "微信 https://mac.weixin.qq.com/"
    "搜狗输入法 https://shurufa.sogou.com/"
    "terminal https://www.terminal.icu/"
    "arc浏览器 https://arc.net/"
    "windsurf https://codeium.com/windsurf"
    "apifox https://apifox.com/"
)

for item in "${soft[@]}"; do
    name=$(echo "$item" | cut -d' ' -f1)
    url=$(echo "$item" | cut -d' ' -f2)
    echo "$name: $url"
    open $url
done

