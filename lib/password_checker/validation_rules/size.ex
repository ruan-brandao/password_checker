defmodule PasswordChecker.ValidationRules.Size do
  @behaviour PasswordChecker.ValidationRule

  @minimum_character_amount 9

  @impl PasswordChecker.ValidationRule
  def valid?(password) do
    byte_size(password) >= @minimum_character_amount
  end
end
