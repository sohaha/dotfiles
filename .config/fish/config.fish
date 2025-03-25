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



