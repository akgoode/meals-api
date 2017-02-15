#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meals"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "meal": {
      "name": "spaghetti and meatballs",
      "ingredients": "spaghetti, meatballs, red sauce, parmesan",
      "instructions": "boil water, cook meatballs, cook pasta, eat"
    }
  }' # \
  # --header "Authorization: Token token=$TOKEN"

echo
