# hook for tmux-window-name
tmux-window-name() {
  if [[ -n $TMUX_PLUGIN_MANAGER_PATH ]] then
    (uv run --quiet $TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py &)
  fi
}

add-zsh-hook chpwd tmux-window-name
