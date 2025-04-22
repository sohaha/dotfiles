test ! -e "$HOME/.x-cmd.root/local/data/fish/rc.fish" || source "$HOME/.x-cmd.root/local/data/fish/rc.fish" # boot up x-cmd.
if status is-interactive
    # Commands to run in interactive sessions can go here
end


# 判断是否存在 devbox 命令
if command -v devbox > /dev/null
    eval "$(devbox global shellenv)"
end

# 判断是否存在 $HOME/.bun/bin 目录
if test -d "$HOME/.bun/bin"
    fish_add_path "$HOME/.bun/bin"
end


# 判断是否存在 $HOME/.go/bin 目录
if test -d "$HOME/.go/bin"
    fish_add_path "$HOME/.go/bin"
    fish_add_path "$HOME/.go/current/bin"
    fish_add_path "$HOME/go/bin"
end


# 设置代理别名
function on_proxy --argument proxy_host
    if test -z "$proxy_host"
        set proxy_host "127.0.0.1:7890"
    end
    
    if not string match -r "^(http|socks5)://" "$proxy_host"
        set proxy_host "http://$proxy_host"
    end
    
    set -gx http_proxy "$proxy_host"
    set -gx https_proxy "$proxy_host"
    set -gx all_proxy "$proxy_host"
    echo "Proxy enabled: $proxy_host"
end

function off_proxy
    set -e http_proxy
    set -e https_proxy
    set -e all_proxy
    echo "Proxy disabled"
end
