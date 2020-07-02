defmodule PasswordChecker.ValidationRules.RepeatedCharactersTest do
  use ExUnit.Case, async: true

  alias PasswordChecker.ValidationRules.RepeatedCharacters

  test "valid?/1 returns true when password has at least one upcase character" do
    refute RepeatedCharacters.valid?("aa")
    refute RepeatedCharacters.valid?("pa$$word")
    assert RepeatedCharacters.valid?("A")
    assert RepeatedCharacters.valid?("paSsword")
  end
end
