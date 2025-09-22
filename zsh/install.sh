echo ''
info 'install zshrc'

SRC="$DOTFILES_ROOT/zsh/zshrc"
DST="$HOME/.zshrc"
START="# >>> added by dotfiles >>>"
END="# <<< added by dotfiles <<<"

touch "$DST"

TMP=$(mktemp)
{
  echo "$START"
  cat "$SRC"
  echo "$END"
} > "$TMP"

cp -f "$DST" "$DST.bak"

awk -v start="$START" -v end="$END" -v replfile="$TMP" '
  BEGIN {
    while ((getline l < replfile) > 0) buf = buf l ORS
    close(replfile)
    inblk = 0
    seen = 0
  }
  index($0, start) {
    print buf
    inblk = 1
    seen = 1
    next
  }
  index($0, end) {
    inblk = 0
    next
  }
  inblk == 0 {
    print
  }
  END {
    if (seen == 0) {
      print buf
    }
  }
' "$DST" > "$DST.new" && mv "$DST.new" "$DST"

rm -f "$TMP"
echo "Updated $DST (backup in $DST.bak)"

success 'install zshrc'
