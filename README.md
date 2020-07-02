# PasswordChecker

Simple implementation of a RESTFul API to validate passwords.

## Table of Contents

* [Project Dependencies](#project-dependencies)
* [Setup](#setup)
* [Testing](#testing)
* [Usage](#usage)
  * [Validate a password](#validate-a-password)

## Project Dependencies

The project uses the following technologies:
* [Elixir language](https://elixir-lang.org/)
* [Phoenix framework](https://www.phoenixframework.org/)

## Setup

To setup the project, run the following steps:
* Install the dependencieslisted on the previous session
* Clone the project using `git clone`
* Install dependencies with `mix deps.get`
* Start the server with `mix phx.server`

The application server will be available at [`localhost:4000`](http://localhost:4000).

## Testing

To run the project's tests, run `mix test`.

## Usage

This system is a RESTFul API that implements password validation. It has a
single endpoint.

### Validate a password

This action will create a new user account.

```
POST /validate_password
```

**Input**:

| Name                    | Type     | Description                                      |
| ----------------------- | -------- | ------------------------------------------------ |
| `password`              | `string` | **Required**. Password to be validated.              |

**Example**:

```json
{
  "password": "AbTp9!fok"
}
```

**Response**:

```
Status: 200 OK
```
```json
{
  "password": "AbTp9!fok",
  "valid": true
}
```

**Response when password is not present**:

```
Status: 500 Internal Server Error
```
```json
{
  "errors": {
    "detail": "Error: Please provide a password."
  }
}
```
