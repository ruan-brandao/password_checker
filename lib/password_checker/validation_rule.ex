defmodule PasswordChecker.ValidationRule do
  @moduledoc """
  Module responsible for defining the behaviour that must be followed by
  modules containing rules for validating passwords.
  """

  @callback valid?(binary()) :: boolean()
end
