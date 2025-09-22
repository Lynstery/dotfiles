echo ''
info 'install zshrc'

setup_zshrc(){
  local overwrite=false backup=false skip=false action=

  SRC="$DOTFILES_ROOT/zsh/zshrc"
  DST="$HOME/.zshrc"
  START="# >>> added by dotfiles >>>"
  END="# <<< added by dotfiles <<<"

  TMP=$(mktemp)
  {
    echo "$START"
    cat "$SRC"
    echo "$END"
  } > "$TMP"

  if [[ -s "$DST" ]]; then
    user "File already exists: $DST ($(basename "$SRC")). What do you want to do?"
    echo "[s]kip, [b]ack up & overwrite"
    read -rn1 action </dev/tty
    echo ""

    case "$action" in
      b) backup=true ;;
      s) skip=true ;;
      *) ;;
    esac

    if [[ $backup == true ]]; then
      cp -f "$DST" "$DST.bak"
      awk -v start="$START" -v end="$END" -v replfile="$TMP" '
        BEGIN{while((getline l<replfile)>0)buf=buf l ORS;close(replfile);inblk=0;seen=0}
        index($0,start){print buf;inblk=1;seen=1;next}
        index($0,end){inblk=0;next}
        inblk==0{print}
        END{if(seen==0)print buf}
      ' "$DST.bak" > "$DST"
      success "updated $DST with backup at $DST.bak"
    elif [[ $skip == true ]]; then
      success "skipped $DST"
    fi
  else
    cat "$TMP" > "$DST"
    success "created $DST"
  fi

  rm -f "$TMP"
}
# 其他额外操作
rm -f "$HOME/.config/spaceship.zsh.zwc" 2>/dev/null || true
linkfile "$DOTFILES_ROOT/zsh/spaceship.zsh.symlink" "$HOME/.config/spaceship.zsh"

success 'install zshrc'
