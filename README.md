# Meals API

## Andrew Goode

### Link to front end

Meal Tracker
'http://akgoode.github.io/mealtracker'

### Overview

This is the back end of my first full-stack project.  This site contains all the data necessary for a front-end client to create a recipe book for each user's data.  It contains four tables: users, meals, ingredients, and requirements.  Users have many meals, and meals have many ingredients through requirements.  Ingredients also have many meals through requirements.  Users own their own meals and can create, view, and delete meals at their leisure.  Users do not own ingredients, but they can add ingredients to the database which can then be included in meals by all other users.

Meals have names, instructions, ids, and ingredients through requirements.
Ingredients have names, units, ids, and meals through requirements.
Each requirement has one meal and one ingredient, and the quantity of that ingredient to be used in the meal.  When a user deletes a meal, the associated requirements also get destroyed.

### Authentication

| Verb   | URI Pattern            | Controller#Action    |
|--------|------------------------|----------------------|
| POST   | `/sign-up`             | `users#signup`       |
| POST   | `/sign-in`             | `users#signin`       |
| PATCH  | `/change-password/:id` | `users#changepw`     |
| DELETE | `/sign-out/:id`        | `users#signout`      |


#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```

### Meals

| Verb   | URI Pattern            | Controller#Action    |
|--------|------------------------|----------------------|
| POST   | `/meals`               | `meals#create`       |
| GET    | `/meals`               | `meals#index`        |
| GET    | `/meals/:id`           | `meals#show`         |
| DELETE | `/meals/:id`           | `meals#destroy`      |
| PATCH  | `/meals/:id`           | `meals#update`       |

#### POST /meals

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meals"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "meal": {
      "name": "'"${NAME}"'",
      "instructions": "'"${INSTRUCTIONS}"'"
    }
  }' # \

echo
```

```sh
TOKEN="BAhJIiU1YWE5N2U2YThiZGQ0NjZlNWQ0OTc0MjcyNDQyMzdhYwY6BkVG--62ad500d6ca5fe3f081694426730b48f0bb07a1d" NAME="chicken and rice" INSTRUCTIONS="COOK" sh scripts/meals/create.sh
```

#### GET /meals

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meals"
curl "${API}${URL_PATH}" \
--header "Authorization: Token token=$TOKEN" \
  --include \
  --request GET

echo
```

```sh
TOKEN="BAhJIiU1YWE5N2U2YThiZGQ0NjZlNWQ0OTc0MjcyNDQyMzdhYwY6BkVG--62ad500d6ca5fe3f081694426730b48f0bb07a1d" sh scripts/meals/index.sh
```

#### GET /meals/:id

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meals/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
```

```sh
ID=32 TOKEN="BAhJIiU1YWE5N2U2YThiZGQ0NjZlNWQ0OTc0MjcyNDQyMzdhYwY6BkVG--62ad500d6ca5fe3f081694426730b48f0bb07a1d" sh scripts/meals/show.sh
```

#### DELETE /meals/:id

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meals/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"

echo
```

```sh
ID=44 TOKEN="BAhJIiU1YWE5N2U2YThiZGQ0NjZlNWQ0OTc0MjcyNDQyMzdhYwY6BkVG--62ad500d6ca5fe3f081694426730b48f0bb07a1d" sh scripts/meals/destroy.sh
```

#### PATCH /meals/:id

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meals/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "meal": {
      "name": "'"${NAME}"'",
      "instructions": "'"${INSTRUCTIONS}"'"
    }
  }'

echo
```

```sh
ID=36 TOKEN="BAhJIiU1YWE5N2U2YThiZGQ0NjZlNWQ0OTc0MjcyNDQyMzdhYwY6BkVG--62ad500d6ca5fe3f081694426730b48f0bb07a1d" NAME="new meal" INSTRUCTIONS="BLAH BLAH" sh scripts/meals/update.sh
```

### Ingredients

| Verb   | URI Pattern            | Controller#Action    |
|--------|------------------------|----------------------|
| POST   | `/ingredients`         | `ingredients#create` |
| GET    | `/ingredients`         | `ingredients#index`  |
| GET    | `/ingredients/:id`     | `ingredients#show`   |


#### POST /ingredients

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ingredients"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "ingredient": {
      "name": "'"${NAME}"'",
      "unit": "'"${UNIT}"'"
    }
  }'

echo
```

```sh
TOKEN="BAhJIiU1YWE5N2U2YThiZGQ0NjZlNWQ0OTc0MjcyNDQyMzdhYwY6BkVG--62ad500d6ca5fe3f081694426730b48f0bb07a1d" NAME="steak" UNIT="pounds" sh scripts/ingredients/create.sh
```

#### GET /ingredients

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ingredients"
curl "${API}${URL_PATH}" \
  --include \
  --request GET
echo
```

```sh
sh scripts/ingredients/index.sh
```

#### GET /ingredients/:id

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ingredients/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request GET

echo
```

```sh
ID=5 sh scripts/ingredients/show.sh
```

### Requirements

| Verb   | URI Pattern            | Controller#Action    |
|--------|------------------------|----------------------|
| POST   | `/requirements/`       | `requirements#create`|

#### POST /requirements

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/requirements"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "requirement": {
      "ingredient_id": "'"${INGREDIENT}"'",
      "meal_id": "'"${MEAL}"'",
      "quantity": "'"${QUANTITY}"'"
    }
  }'

echo
```

```sh
TOKEN="BAhJIiU1YWE5N2U2YThiZGQ0NjZlNWQ0OTc0MjcyNDQyMzdhYwY6BkVG--62ad500d6ca5fe3f081694426730b48f0bb07a1d" INGREDIENT="76" MEAL="35" QUANTITY=3 sh scripts/requirements/create.sh
```
