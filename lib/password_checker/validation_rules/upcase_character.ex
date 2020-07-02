defmodule PasswordChecker.ValidationRules.UpcaseCharacter do
  @behaviour PasswordChecker.ValidationRule

  @impl PasswordChecker.ValidationRule
  def valid?(password) do
    String.match?(password, ~r/[A-Z]+/)
  end
end
