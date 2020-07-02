defmodule PasswordChecker.ValidationRules.Digit do
  def valid?(password) do
    String.match?(password, ~r/\d+/)
  end
end
