defmodule PasswordChecker.ValidationRules.SpecialCharacterTest do
  use ExUnit.Case, async: true

  alias PasswordChecker.ValidationRules.SpecialCharacter

  test "valid?/1 returns true when password has at least one special character" do
    refute SpecialCharacter.valid?("aB")
    refute SpecialCharacter.valid?("p4SSworD")
    assert SpecialCharacter.valid?("!")
    assert SpecialCharacter.valid?("Pa$sword")
    assert SpecialCharacter.valid?("pass_word")
  end
end
