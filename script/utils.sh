#!/usr/bin/env bash

info() {
  printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

user() {
  printf "\r  [ \033[0;33m??\033[0m ] %s" "$1"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n\n" "$1"
  exit 1
}

shortpath() {
  local path=$1
  path="${path/#$HOME/~}"
  echo "$path"
}

linkfile() {
  local src=$1 dst=$2
  local update=false skip=false action=

  if [[ -e "$dst" ]]; then
    if [[ $update_all != true && $skip_all != true ]]; then

      user "File already exists: $(shortpath "$dst")$( [ -L "$dst" ] && printf ' （%s）' "$(shortpath "$(readlink "$dst")")" )"
      echo ""
      user "What do you want to do? [s]kip, [S]kip all, [u]pdate, [U]pdate all? "
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
      info "$src already exists"
    fi

    if [[ $skip == true || $skip_all == true ]]; then
      success "skipped $src"
      return
    fi

    if [[ -L "$dst" && "$(readlink "$dst")" == $src ]]; then
      success "$(shortpath "$src") is already linked to $(shortpath "$dst")"
    else
      cp -r -- "$dst" "$dst.bak"
      success "backup $(shortpath "$dst") to $(shortpath "$dst").bak"
      rm -rf -- "$dst"
      ln -s -- "$src" "$dst"
      success "linked $(shortpath "$src") to $(shortpath "$dst")"
    fi
  else
    info "$(shortpath "$dst") not exists"
    ln -s -- "$src" "$dst"
    success "linked $(shortpath "$src") to $(shortpath "$dst")"
  fi
}
