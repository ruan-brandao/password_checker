defmodule PasswordCheckerWeb.PasswordValidationsController do
  use PasswordCheckerWeb, :controller

  def new(conn, %{"password" => password}) do
    json(conn, %{password: password, valid: PasswordChecker.valid?(password)})
  end

  def new(conn, _params) do
    conn
    |> put_status(500)
    |> put_view(PasswordCheckerWeb.PasswordValidationsView)
    |> render("500.json")
  end
end
