defmodule PasswordChecker.ValidationRules.Digit do
  @moduledoc """
  Validation rule that checks if the password has at least one digit.
  """

  @behaviour PasswordChecker.ValidationRule

  @impl PasswordChecker.ValidationRule
  def valid?(password) do
    String.match?(password, ~r/\d+/)
  end
end
