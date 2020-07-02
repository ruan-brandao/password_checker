defmodule PasswordChecker.ValidationRules.SpecialCharacter do
  @behaviour PasswordChecker.ValidationRule

  @impl PasswordChecker.ValidationRule
  def valid?(password) do
    String.match?(password, ~r/[\W|_]+/)
  end
end
