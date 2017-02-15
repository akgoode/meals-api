#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meals/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "meal": {
      "name": "'"${NAME}"'",
      "ingredients": "'"${diagnosis}"'",
      "instructions": "'"${BORN_ON}"'"
    }
  }' # \
  # --header "Authorization: Token token=$TOKEN"

echo
