defmodule PasswordChecker.ValidationRules.Size do
  @minimum_character_amount 9

  def valid?(password) do
    byte_size(password) >= @minimum_character_amount
  end
end
