#!/usr/bin/env bash

info() {
  printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

user() {
  printf "\r  [ \033[0;33m??\033[0m ] %s\n" "$1"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n\n" "$1"
  exit 1
}

linkfile() {
  local src=$1 dst=$2
  local overwrite=false backup=false skip=false action=

  if [[ -e "$dst" ]]; then
    if [[ $overwrite_all != true && $backup_all != true && $skip_all != true ]]; then

      user "File already exists: $dst ($(basename "$src")).
      What do you want to do?"

      echo "[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
      read -rn1 action </dev/tty
      echo ""

      case "$action" in
        o) overwrite=true ;;
        O) overwrite_all=true ;;
        b) backup=true ;;
        B) backup_all=true ;;
        s) skip=true ;;
        S) skip_all=true ;;
        *) ;;
      esac
    fi

    [[ $overwrite == true || $overwrite_all == true ]] && {
      rm -rf -- "$dst"
      success "removed $dst"
    }

    [[ $backup == true || $backup_all == true ]] && {
      mv -- "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    }

    [[ $skip == true || $skip_all == true ]] && {
      success "skipped $src"
      return
    }
  fi

  ln -s -- "$src" "$dst"
  success "linked $src to $dst"
}
