# PasswordChecker

Simple implementation of a RESTFul API to validate passwords.

## Table of Contents

* [Project Dependencies](#project-dependencies)
* [Setup](#setup)
* [Testing](#testing)
* [Usage](#usage)
  * [Validate a password](#validate-a-password)
* [Technical Decisions](#technical-decisions)

## Project Dependencies

The project uses the following technologies:
* [Elixir language](https://elixir-lang.org/)
* [Phoenix framework](https://www.phoenixframework.org/)

## Setup

To setup the project, run the following steps:
* Install the dependencies listed on the previous session
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

## Technical Decisions

The logic for validating passwords is exposed on the
[`PasswordChecker`](/lib/password_checker.ex) module. The module contains a list
with all the rules used for validating a password. Each rule on this list is a
module that implements the
[`PasswordChecker.ValidationRule`](lib/password_checker/validation_rule.ex)
behaviour, which means that it must implement a `valid?/1` function that receives
a password string and returns a boolean indicating if the password passes the
validation.

The `PasswordChecker.valid?/2` function iterates over this list passing the
password to be validated through each rule, and then checks the result. If the
password passes all validations, it returns `true`, if the password fails on one
or more validations, it returns `false`.

With this architecture, the logic for each validation is isolated on its own
module, making them easier to maintain. This also makes it easier to add or
remove validation rules, so when there is a need to do that, it is possible to
just update the [`@validation_rules` list](lib/password_checker.ex#L7) and add
or delete the respective module.
