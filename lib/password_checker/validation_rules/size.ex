defmodule PasswordChecker.ValidationRules.Size do
  @moduledoc """
  Validation rule that checks if the password has a valid size. 
  """

  @behaviour PasswordChecker.ValidationRule

  @minimum_character_amount 9

  @impl PasswordChecker.ValidationRule
  def valid?(password) do
    byte_size(password) >= @minimum_character_amount
  end
end
