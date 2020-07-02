defmodule PasswordChecker.ValidationRules.RepeatedCharacters do
  @moduledoc """
  Validation rule that checks if the password has no repeated characters. 
  """

  @behaviour PasswordChecker.ValidationRule

  @impl PasswordChecker.ValidationRule
  def valid?(password) do
    character_count(password) == unique_character_count(password)
  end

  defp character_count(string) do
    string |> String.graphemes() |> Enum.count()
  end

  defp unique_character_count(string) do
    string |> String.graphemes() |> Enum.uniq() |> Enum.count()
  end
end
