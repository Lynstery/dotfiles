func_proxy_set(){
    port=${1:-7890}
    export https_proxy=http://127.0.0.1:$port
    export http_proxy=http://127.0.0.1:$port
    export all_proxy=socks5://127.0.0.1:$port
    git config --global http.proxy http://127.0.0.1:$port
    git config --global https.proxy http://127.0.0.1:$port
    echo "Proxy set: 127.0.0.1:$port"
}

func_proxy_unset(){
    unset http_proxy
    unset https_proxy
    unset all_proxy
    echo "Proxy closed"
}

func_proxy_test(){
  echo "Test curl to www.google.com..."
  resp=$(curl -I -s --connect-timeout 3 -m 3 -w "%{http_code}" -o /dev/null www.google.com)
  if [ ${resp} = 200 ]; then
    echo "Proxy setup succeeded!"
  else
    echo "Proxy setup failed!"
  fi
}

alias proxyon='func_proxy_set'
alias proxyoff='func_proxy_unset'
alias proxytest='func_proxy_test'
