defmodule PasswordCheckerWeb.PasswordValidationsControllerTest do
  use PasswordCheckerWeb.ConnCase, async: true

  alias PasswordCheckerWeb.Router.Helpers

  describe "new" do
    test "returns valid as true when password is valid", %{conn: conn} do
      conn = post(conn, Helpers.password_validations_path(conn, :new, %{password: "AbTp9!fok"}))

      assert json_response(conn, 200)["valid"]
    end

    test "returns valid as false when password is invalid", %{conn: conn} do
      conn = post(conn, Helpers.password_validations_path(conn, :new, %{password: "invalid"}))

      refute json_response(conn, 200)["valid"]
    end

    test "returns an error when password is not present", %{conn: conn} do
      conn = post(conn, Helpers.password_validations_path(conn, :new, %{}))

      assert json_response(conn, 500)
      assert json_response(conn, 500)["errors"]["detail"] == "Error: Please provide a password."
    end

    test "returns 200 status when password is not a string", %{conn: conn} do
      conn = post(conn, Helpers.password_validations_path(conn, :new, %{password: 1234}))

      assert json_response(conn, 200)
      refute json_response(conn, 200)["valid"]
    end
  end
end
