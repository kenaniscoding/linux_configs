#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
FILENAME="screenshot_$(date +%Y%m%d_%H%M%S).png"

# Create the directory if it doesn't exist
mkdir -p "$DIR"

# Take screenshot and save it
if flameshot gui -r >"$DIR/$FILENAME" && [ -s "$DIR/$FILENAME" ]; then
  # Screenshot was taken successfully (file exists and has content)
  xclip -selection clipboard -t image/png -i "$DIR/$FILENAME" &&
    copyq add image/png - <"$DIR/$FILENAME"
else
  # Screenshot was cancelled or failed, remove empty file
  rm -f "$DIR/$FILENAME"
fi
