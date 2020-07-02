defmodule PasswordChecker.ValidationRules.DigitTest do
  use ExUnit.Case, async: true

  alias PasswordChecker.ValidationRules.Digit

  test "valid?/1 returns true when password has at least one digit" do
    refute Digit.valid?("a")
    refute Digit.valid?("abcdefgh")
    assert Digit.valid?("123456789")
    assert Digit.valid?("p4ssword")
  end
end
