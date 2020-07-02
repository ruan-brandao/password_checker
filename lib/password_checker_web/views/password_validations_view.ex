defmodule PasswordCheckerWeb.PasswordValidationsView do
  use PasswordCheckerWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  def render("500.json", _assigns) do
    %{errors: %{detail: "Error: Please provide a password."}}
  end
end
