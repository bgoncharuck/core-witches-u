#!/bin/sh

TEST_DIR=$(dirname "$0")
ASSETS_DIR="$TEST_DIR/../assets/json"
ERROR=0

find "$ASSETS_DIR" -type f -name "*.json" | while read file; do
  FILE_NAME=$(basename "$file")
  echo "$FILE_NAME - check"
  
  duplicates=$(jq -r '.[].id' "$file" | sort | uniq -d)
  
  if [ ! -z "$duplicates" ]; then
    echo "$FILE_NAME - has duplicate IDs:"
    echo "$duplicates"
    echo ""
    ERROR=1
  else
    echo "$FILE_NAME - correct"
    echo ""
  fi
done

if [ $ERROR -eq 1 ]; then
  echo "Duplicate IDs"
  exit 1
else
  echo "All IDs are unique in all JSON files"
fi