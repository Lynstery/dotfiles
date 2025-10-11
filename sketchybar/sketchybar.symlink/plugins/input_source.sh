#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# use im-select
CURRENT_INPUT=$(/usr/local/bin/im-select)

case "$CURRENT_INPUT" in
  "com.apple.keylayout.ABC") LABEL="ABC" ;;
  "com.apple.inputmethod.SCIM.ITABC") LABEL="拼音" ;;
  "com.apple.keylayout.US") LABEL="US" ;;
  *) LABEL="$CURRENT_INPUT" ;;
esac

sketchybar --set $NAME icon="" label="$LABEL"
