# sesh (outside of tmux)
function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session

    session=$(sesh list --icons | fzf --height 60% \
      --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
      --layout=reverse --style full --border --padding 1,2 \
      --header '  ^a:all  ^t:tmux  ^g:configs  ^x:zoxide  ^d:kill ^f:find' \
      --bind 'tab:down,btab:up' \
      --bind 'ctrl-n:down,ctrl-p:up' \
      --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
      --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
      --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
      --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
      --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
      --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
      --preview-window 'right:50%' \
      --preview 'sesh preview {}'
    )
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return

    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions
