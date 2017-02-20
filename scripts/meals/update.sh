#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meals/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json Authorization: Token token=$TOKEN" \
  --data '{
    "meal": {
      "name": "'"${NAME}"'",
      "instructions": "'"${INSTRUCTIONS}"'"
    }
  }' # \
  # --header "Authorization: Token token=$TOKEN"

echo
