defmodule PasswordChecker.ValidationRules.Digit do
  @behaviour PasswordChecker.ValidationRule

  @impl PasswordChecker.ValidationRule
  def valid?(password) do
    String.match?(password, ~r/\d+/)
  end
end
