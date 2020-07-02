defmodule PasswordChecker.ValidationRules.UpcaseCharacter do
  def valid?(password) do
    String.match?(password, ~r/[A-Z]+/)
  end
end
