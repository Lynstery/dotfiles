#!/usr/bin/env zsh

fpath+=( "${0:A:h}" )

for cmd in ${0:A:h}/*; do
  [[ -f $cmd ]] || continue
  [[ $cmd == ${0:A:h}/plugin.zsh ]] && continue
  [[ ${cmd:t} == _* ]] && continue

  cmd_name=${cmd:t}

  source "$cmd"

  if [[ -f ${0:A:h}/_$cmd_name ]]; then
    autoload -Uz "_$cmd_name" 2>/dev/null || true
    compdef "_$cmd_name" "$cmd_name"
  fi
done
