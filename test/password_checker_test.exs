defmodule PasswordCheckerTest do
  use ExUnit.Case, async: true

  defmodule PassingValidation do
    def valid?(_), do: true
  end

  defmodule FailingValidation do
    def valid?(_), do: false
  end

  test "valid?/2 returns true when all validations are successful" do
    validation_rules = [PassingValidation, PassingValidation]

    assert PasswordChecker.valid?("password", validation_rules)
  end

  test "valid?/2 returns false when one or more validations fail" do
    validation_rules = [PassingValidation, FailingValidation, PassingValidation]

    refute PasswordChecker.valid?("password", validation_rules)
  end
end
