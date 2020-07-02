defmodule PasswordChecker.ValidationRules.UpcaseCharacterTest do
  use ExUnit.Case, async: true

  alias PasswordChecker.ValidationRules.UpcaseCharacter

  test "valid?/1 returns true when password has at least one upcase character" do
    refute UpcaseCharacter.valid?("a")
    refute UpcaseCharacter.valid?("pa$$word")
    assert UpcaseCharacter.valid?("A")
    assert UpcaseCharacter.valid?("Password")
  end
end
