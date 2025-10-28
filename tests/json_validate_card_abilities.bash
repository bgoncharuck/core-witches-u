#!/bin/bash

TEST_DIR=$(dirname "$0")
ASSETS_DIR="$TEST_DIR/../assets/json"

ABILITIES_FILE="$ASSETS_DIR/abilities.json"
CARDS_FILE="$ASSETS_DIR/cards.json"

ERROR=0

VALID_IDS=$(jq -r '.[].id' "$ABILITIES_FILE")

while read -r card; do
  CARD_NAME=$(echo "$card" | jq -r '.name')

  for ability_field in firstAbility secondAbility thirdAbility commonDeckAbility uncommonDeckAbility rareDeckAbility; do
    ABILITY=$(echo "$card" | jq -c ".${ability_field}")
    ABILITY_ID=$(echo "$ABILITY" | jq -r '.id')
    VALUE=$(echo "$ABILITY" | jq -r '.value')

    if ! echo "$VALID_IDS" | grep -qx "$ABILITY_ID"; then
      echo "Card '$CARD_NAME' - $ability_field has invalid ability ID: $ABILITY_ID"
      ERROR=1
    fi

    if ! echo "$VALUE" | grep -Eq '^[0-9]+$'; then
      echo "Card '$CARD_NAME' - $ability_field has non-integer value: $VALUE"
      ERROR=1
    fi
  done
done < <(jq -c '.[]' "$CARDS_FILE")

if [ $ERROR -eq 1 ]; then
  echo "Cards validation failed"
  exit 1
else
  echo "All cards are valid"
fi

echo "---------------------------"