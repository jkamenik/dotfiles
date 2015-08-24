#!/bin/bash
LOAD_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $LOAD_PATH/src/files.sh

mkdir -p $BACKUP_PATH

for f in $FILES; do
  if [ -f "$HOME/$f" ]; then
    echo "$f exists, backing up"
    mkdir -p "$(dirname $BACKUP_PATH/$f)"

    cp "$HOME/$f" "$BACKUP_PATH/$f"
  fi

  echo "Installing $f"
  cp "$FILE_PATH/$f" "$HOME"
done
