defmodule PasswordChecker.ValidationRules.SizeTest do
  use ExUnit.Case, async: true

  alias PasswordChecker.ValidationRules.Size

  test "valid?/1 returns true when password is at least 9 characters long" do
    refute Size.valid?("")
    refute Size.valid?("a")
    refute Size.valid?("12345678")
    assert Size.valid?("123456789")
    assert Size.valid?("really-long-password")
  end
end
