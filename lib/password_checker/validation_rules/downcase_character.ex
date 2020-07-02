defmodule PasswordChecker.ValidationRules.DowncaseCharacter do
  def valid?(password) do
    String.match?(password, ~r/[a-z]+/)
  end
end
