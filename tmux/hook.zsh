# hook for tmux-window-name
tmux-window-name() {
  if [[ -n $TMUX && -x ~/.config/tmux/plugins/tmux-window-name/scripts/rename_session_windows.py ]]; then
    (uv run --quiet ~/.config/tmux/plugins/tmux-window-name/scripts/rename_session_windows.py &)
  fi
}

add-zsh-hook chpwd tmux-window-name
