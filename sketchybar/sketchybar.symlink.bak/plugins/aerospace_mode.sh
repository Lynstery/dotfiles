#!/bin/bash

CURRENT_MODE=$(aerospace list-modes --current)

if [ "$CURRENT_MODE" == "main" ]; then
  sketchybar --set "$NAME" icon="N"
elif [ "$CURRENT_MODE" == "service" ]; then
  sketchybar --set "$NAME" icon="S"
else
  sketchybar --set "$NAME" icon="A"
fi
