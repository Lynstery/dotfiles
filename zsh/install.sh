echo ''
info '[zshrc]'

setup_zshrc(){

  local update=false skip=false action=

  SRC="$DOTFILES_ROOT/zsh/zshrc"
  DST="$HOME/.zshrc"
  START="# >>> added by dotfiles >>>"
  END="# <<< added by dotfiles <<<"

  info "update $(shortpath "$DST") ..."

  if [[ -e "$DST" ]]; then
    if [[ $update_all != true && $skip_all != true ]]; then

      user "File already exists: $(shortpath "$DST")$( [ -L "$DST" ] && printf ' （%s）' "$(shortpath "$(readlink "$DST")")" )"
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
    else
      info "$(shortpath "$DST") already exists"
    fi

    if [[ $skip == true || $skip_all == true ]]; then
      success "skipped $(shortpath "$SRC")"
      return
    fi

    cp -r -- "$DST" "${DST}.bak"
    success "backup $(shortpath "$DST") to $(shortpath "$DST.bak")"

    content="$(cat "$SRC")"

    awk -v start="$START" -v end="$END" -v src="$SRC" '
      BEGIN {
        buf = start ORS
        while ((getline l < src) > 0) buf = buf l ORS
        close(src)
        buf = buf end ORS
        inblk = 0
        seen  = 0
      }
      index($0,start){printf "%s", buf;inblk=1;seen=1;next}
      index($0,end){inblk=0;next}
      inblk==0{print}
      END {if (seen == 0) printf "%s", buf}
    ' "$DST.bak" > "$DST"

    success "updated $(shortpath "$DST")"

  else
    success "$(shortpath "$DST") not exists"
    cat "$TMP" > "$DST"
    success "created $(shortpath "$DST")"
  fi
}

setup_zshrc

#linkfile "$DOTFILES_ROOT/zsh/starship.toml.symlink" "$HOME/.config/starship.toml"
linkfile "$DOTFILES_ROOT/zsh/spaceship.zsh.symlink" "$HOME/.config/spaceship.zsh"

success '[zshrc]'
