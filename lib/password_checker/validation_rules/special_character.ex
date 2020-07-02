defmodule PasswordChecker.ValidationRules.SpecialCharacter do
  def valid?(password) do
    String.match?(password, ~r/[\W|_]+/)
  end
end
