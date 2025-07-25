#!/bin/bash

set -e

CONFIG_DIR="$(cd "$(dirname "$0")" && pwd)"

FILES=(
  ".emacs"
  ".emacs.custom.el"
  ".emacs.rc"
)

for FILE in "${FILES[@]}"; do
  TARGET="$HOME/$FILE"
  SOURCE="$CONFIG_DIR/$FILE"

  if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
    echo "Backing up existing $TARGET to $TARGET.bak"
    mv "$TARGET" "$TARGET.bak"
  fi

  ln -sv "$SOURCE" "$TARGET"
done

echo "Emacs config symlinked successfully."
