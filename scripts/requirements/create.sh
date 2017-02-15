#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/requirements"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "requirement": {
      "ingredient_id": "'"${INGREDIENT}"'",
      "meal_id": "'"${MEAL}"'",
      "quantity": "'"${QUANTITY}"'"
    }
  }' # \
  # --header "Authorization: Token token=$TOKEN"

echo
