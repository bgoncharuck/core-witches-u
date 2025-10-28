#!/bin/sh

TEST_DIR=$(dirname "$0")
ASSETS_DIR="$TEST_DIR/../assets/json"

find "$ASSETS_DIR" -type f -name "*.json" | while read file; do
  FILE_NAME=$(basename "$file")
  echo "$FILE_NAME - check"
  
  duplicates=$(jq -r '.[].id' "$file" | sort | uniq -d)
  
  if [ ! -z "$duplicates" ]; then
    echo "$FILE_NAME - has duplicate IDs:"
    echo "$duplicates"
    echo ""
    exit 1
  else
    echo "$FILE_NAME - correct"
  fi

  types=$(jq -r '.[].type' "$file" | sort | uniq)
  if [ ! -z "$types" ]; then
    echo "$FILE_NAME - types:"
    echo "$types"
  fi

done

echo "---------------------------"