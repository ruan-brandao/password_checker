defmodule PasswordChecker do
  @moduledoc """
  Module responsible for exposing the main password validation logic of the
  application.
  """

  @validation_rules [
    PasswordChecker.ValidationRules.Size,
    PasswordChecker.ValidationRules.Digit,
    PasswordChecker.ValidationRules.DowncaseCharacter,
    PasswordChecker.ValidationRules.UpcaseCharacter,
    PasswordChecker.ValidationRules.SpecialCharacter,
    PasswordChecker.ValidationRules.RepeatedCharacters
  ]

  @doc """
  Function responsible for validating a password. Returns `true` when the
  password is valid and `false` when the password is invalid.

  Parameters
    * password: String of the password to be validated
    * validation_rules: List with the modules containing the rules used to
      validate the password.
  """
  @spec valid?(binary(), [module()]) :: boolean()
  def valid?(password, validation_rules \\ @validation_rules) do
    validation_rules
    |> Enum.map(& &1.valid?(password))
    |> Enum.all?(&(&1 == true))
  end
end
