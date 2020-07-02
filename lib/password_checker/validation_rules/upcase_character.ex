defmodule PasswordChecker.ValidationRules.UpcaseCharacter do
  @moduledoc """
  Validation rule that checks if the password has at least one upcase character. 
  """

  @behaviour PasswordChecker.ValidationRule

  @impl PasswordChecker.ValidationRule
  def valid?(password) do
    String.match?(password, ~r/[A-Z]+/)
  end
end
