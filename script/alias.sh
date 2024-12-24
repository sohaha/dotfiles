

alias fv='nvim $(fzf)'
alias y='yazi'
# alias cd='zoxide'

function proxy_off(){
    unset http_proxy
    unset https_proxy

    if command -v git &> /dev/null; then
        git config --unset http.proxy
        git config --unset https.proxy
    fi
    
    echo  "proxy is off"
}

function proxy_on() {
    # socks5://127.0.0.1:10808
    local proxy_url="http://127.0.0.1:7890"
    if [ -n "$1" ]; then
        if [[ $1 != *":"* ]]; then
            proxy_url="127.0.0.1:$1"
        else
            proxy_url="$1"
        fi
        if [[ $proxy_url != *"://"* ]]; then
            proxy_url="http://$proxy_url"
        fi
    fi
    export no_proxy="localhost,127.0.0.1"
    export http_proxy=$proxy_url
    export https_proxy=$http_proxy
    if command -v git &> /dev/null; then
        git config http.proxy $https_proxy  &> /dev/null
        git config https.proxy $https_proxy &> /dev/null
    fi
    echo  "prxoy is on: $https_proxy"
    proxy_status
}

function proxy_status() {
    echo $https_proxy
    curl cip.cc
}