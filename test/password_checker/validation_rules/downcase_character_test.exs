defmodule PasswordChecker.ValidationRules.DowncaseCharacterTest do
  use ExUnit.Case, async: true

  alias PasswordChecker.ValidationRules.DowncaseCharacter

  test "valid?/1 returns true when password has at least one downcase character" do
    refute DowncaseCharacter.valid?("A")
    refute DowncaseCharacter.valid?("P4$$WORD")
    assert DowncaseCharacter.valid?("a")
    assert DowncaseCharacter.valid?("PASSWORd")
  end
end
