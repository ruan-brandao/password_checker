defmodule PasswordChecker.ValidationRules.RepeatedCharacters do
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
