defmodule PasswordChecker.ValidationRules.DowncaseCharacter do
  @behaviour PasswordChecker.ValidationRule

  @impl PasswordChecker.ValidationRule
  def valid?(password) do
    String.match?(password, ~r/[a-z]+/)
  end
end
