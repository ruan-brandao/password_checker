defmodule PasswordChecker.ValidationRules.DowncaseCharacter do
  @moduledoc """
  Validation rule that checks if the password has at least one downcase
  character. 
  """

  @behaviour PasswordChecker.ValidationRule

  @impl PasswordChecker.ValidationRule
  def valid?(password) do
    String.match?(password, ~r/[a-z]+/)
  end
end
