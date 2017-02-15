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
      "instructions": "boil water, cook meatballs, cook pasta, eat",
      "user_id": "'"${USER}"'"
    }
  }' # \
  # --header "Authorization: Token token=$TOKEN"

echo
