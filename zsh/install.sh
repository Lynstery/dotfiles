info 'install zshrc'

SRC="$DOTFILES_ROOT/zsh/zshrc"
DST="$HOME/.zshrc"

START="# <<< added by ~/.dotfiles"
END="# >>> added by ~/.dotfiles"

touch "$DST"

TMP=$(mktemp)
{
  echo "$START"
  cat "$SRC"
  echo "$END"
} > "$TMP"

if grep -q "$START" "$DST" 2>/dev/null; then
  echo "Updating section in $DST"
  if sed --version >/dev/null 2>&1; then
    # GNU sed
    sed -i.bak "/$START/,/$END/{ r $TMP
d }" "$DST"
  else
    # macOS/BSD sed
    sed -i.bak "/$START/,/$END/{
      r $TMP
      d
    }" "$DST"
  fi
else
  echo "Appending new section to $DST"
  cat "$TMP" >> "$DST"
fi

rm -f "$TMP"
echo " Updated $DST (backup in $DST.bak)"

success 'install zshrc'
