# Tic Tac Toe API

Task is to build a simple tic tac toe api application using Ruby on Rails that allows
users play game after integrating apis to any framework.


## API Endpoints 

Here is the information about two API endpoints for managing games. The endpoints are part of the `/api/v1` namespace and can be accessed through the following URLs:

## Create a Game

- **Endpoint:** POST `/api/v1/games`
- **Description:** This endpoint allows you to create a new game.
- **Headers:**
  | Key    | Value                                           |
  |--------|-------------------------------------------------|
  | Content-Type  |  application/json          |
- **Request Body:** None

### Example cURL Request

```bash
curl --location --request POST 'http://localhost:3000/api/v1/games' \
--header '' \
--data ''
```

### Response

- **Status:** 200 OK
- **Body:** The response will contain details about the created game.
- Body Example:
```json
{
  "id": 251,
  "state": "---------",
  "created_at": "2023-06-20T14:48:09.086Z",
  "updated_at": "2023-06-20T14:48:09.086Z"
}
```

---

## Update a Game

- **Endpoint:** PATCH `/api/v1/games/:id`
- **Description:** This endpoint allows you to update an existing game by providing the game ID and the move to be made.
- **Headers:**
  | Key           | Value                            |
  |---------------|----------------------------------|
  | Content-Type  | application/json                 |
  
- **Request Body:**
  | Key   | Value       |
  |-------|-------------|
  | move  | [move-value][0-8]|

### Example cURL Request

```bash
curl --location --request PATCH 'http://localhost:3000/api/v1/games/251' \
--header 'Content-Type: application/json' \
--header '' \
--data '{
  "move": 8
}'
```

### Response

- **Status:** 200 OK
- **Body:** The response will contain details about the updated game.

- Body Example:
``` JSON
{
    "message": null,
    "game": {
        "id": 251,
        "state": "--O-----X",
        "created_at": "2023-06-20T14:48:09.086Z",
        "updated_at": "2023-06-20T14:48:15.628Z"
    }
}
```

## Steps to Run the project Locally

To run this project, you will need to add the following libraries to your system

`ruby: 3.0.0`

`rails: 7.0.5`

### Installing Dependencies
once you have them on your machine and you are in project folder, run `bundle install` and all of the project dependencies will be installed.


#### Database creation

Create make sure you have postgresql installed and provide details of database in file(if needed):

```bash
database.yml
```


After that you can create a database and run seed files by

```bash
  rails db:create
  rails db:migrate
```
once all done you just need to run the project by starting the server

```bash
  rails s
```

## Author

- [github:@muhammad-ur-rehman](https://github.com/muhammad-ur-rehman)

- [linkedin:@m-ur-rehman](https://www.linkedin.com/in/m-ur-rehman/)
