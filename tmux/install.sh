echo ''
info '[tmux]'

setup_tmux_plugins(){
  local update=false skip=false action=

  TMUX_PLUGINS_PATH=$DOTFILES_ROOT/tmux/tmux.symlink/plugins

  user "update tmux plugins..."

  if [[ $update_all != true && $skip_all != true ]]; then
    echo ""
    user "What do you want to do? [s]kip, [S]kip all, [u]pdate, [U]pdate? "
    read -rn1 action </dev/tty
    echo ""

    case "$action" in
      u) update=true ;;
      U) update_all=true ;;
      s) skip=true ;;
      S) skip_all=true ;;
      *) ;;
    esac

  fi

  if [[ $skip == true || $skip_all == true ]]; then
    success "skipped"
    return
  fi

  for repo in \
    "https://github.com/catppuccin/tmux.git@v2.1.3 $TMUX_PLUGINS_PATH/catppuccin/tmux" \
    "https://github.com/tmux-plugins/tmux-yank $TMUX_PLUGINS_PATH/tmux-yank" \
    "https://github.com/tmux-plugins/tmux-logging $TMUX_PLUGINS_PATH/tmux-logging" \
    "https://github.com/Lynstery/tmux-window-name $TMUX_PLUGINS_PATH/tmux-window-name" \
    "https://github.com/tmux-plugins/tmux-resurrect $TMUX_PLUGINS_PATH/tmux-resurrect" \
    "https://github.com/tmux-plugins/tmux-continuum $TMUX_PLUGINS_PATH/tmux-continuum"
  do
    url="${repo%% *}"
    path="${repo#* }"
    branch=""
    [[ "$url" == *"@"* ]] && branch="-b ${url##*@}" && url="${url%@*}"

    if [ -d "$path/.git" ]; then
      echo "$path is already cloned"
      echo "Updating $(basename "$path")..."
      if git -C "$path" symbolic-ref -q HEAD >/dev/null; then
        git -C "$path" pull --ff-only
      else
        echo "$(basename "$path") is detached (skipping pull)"
      fi
    else
      echo "Cloning $(basename "$path")..."
      git clone $branch "$url" "$path"
    fi
  done

  success 'update tmux plugins'

}


linkfile "$DOTFILES_ROOT/tmux/tmux.symlink" "$HOME/.config/tmux"

setup_tmux_plugins

success '[tmux]'
