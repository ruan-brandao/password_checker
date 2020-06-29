defmodule PasswordChecker.Validator do
  @moduledoc """
  Module responsible for holding the password validation logic.
  """

  @doc """
  Function responsible for validating a password. Returns `true` when the
  password is valid and `false` when the password is invalid.

  Parameters
    * password: String of the password to be validated
  """
  @spec valid?(binary()) :: boolean()
  def valid?(""), do: false
  def valid?(password) when byte_size(password) < 9, do: false

  def valid?(password) do
    has_digits?(password) &&
      has_downcase_character?(password) &&
      has_upcase_character?(password) &&
      has_special_character?(password) &&
      has_no_repeated_characters?(password)
  end

  defp has_digits?(password) do
    String.match?(password, ~r/\d+/)
  end

  defp has_downcase_character?(password) do
    String.match?(password, ~r/[a-z]+/)
  end

  defp has_upcase_character?(password) do
    String.match?(password, ~r/[A-Z]+/)
  end

  defp has_special_character?(password) do
    String.match?(password, ~r/[\W|_]+/)
  end

  defp has_no_repeated_characters?(password) do
    password |> String.graphemes() |> Enum.count() ==
      password |> String.graphemes() |> Enum.uniq() |> Enum.count()
  end
end
