defmodule PasswordChecker.ValidationRules.SpecialCharacter do
  @moduledoc """
  Validation rule that checks if the password has at least one special
  character. 
  """

  @behaviour PasswordChecker.ValidationRule

  @impl PasswordChecker.ValidationRule
  def valid?(password) do
    String.match?(password, ~r/[\W|_]+/)
  end
end
