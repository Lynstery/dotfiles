echo ''
info '[git]'

setup_gitconfig () {
  info 'fill gitconfig.local.symlink ...'
  if ! [ -f $DOTFILES_ROOT/git/gitconfig.local.symlink ]
  then
    git_credential='store'
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential='osxkeychain'
    fi

    user ' - What is your github author name? '
    read -e git_authorname < /dev/tty
    user ' - What is your github author email? '
    read -e git_authoremail < /dev/tty

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" $DOTFILES_ROOT/git/gitconfig.local.symlink.example > $DOTFILES_ROOT/git/gitconfig.local.symlink
    success 'filled gitconfig.local.symlink'
  else
    success 'gitconfig.local.symlink already filled'
  fi
}

setup_gitconfig

for src in $(find -H "$DOTFILES_ROOT/git" -maxdepth 1 -name '*.symlink')
do
  dst="$HOME/.$(basename "${src%.*}")"
  linkfile "$src" "$dst"
done

success '[git]'
