#!/bin/bash

LOAD_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $LOAD_PATH/src/files.sh

for f in $FILES; do
  abs="$HOME/$f"
  echo "Syncing $f"

  mkdir -p $(dirname $FILE_PATH/$f)

  cp $abs $FILE_PATH/$f
done
