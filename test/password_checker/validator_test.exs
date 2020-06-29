defmodule PasswordChecker.ValidatorTest do
  use ExUnit.Case, async: true

  alias PasswordChecker.Validator

  test "valid?/1 returns false if the password has less than 9 characters" do
    refute Validator.valid?("")
    refute Validator.valid?("aa")
    refute Validator.valid?("ab")
    refute Validator.valid?("12345678")
  end

  test "valid?/1 returns false when password has no digits in it" do
    assert Validator.valid?("AbTp9!fok")
    refute Validator.valid?("AbTpu!fok")
  end

  test "valid?/1 returns false when password has no downcase characters" do
    assert Validator.valid?("AbTp9!fok")
    refute Validator.valid?("ABTP9!FOK")
  end

  test "valid?/1 returns false when password has no upcase characters" do
    assert Validator.valid?("AbTp9!fok")
    refute Validator.valid?("abtp9!fok")
  end

  test "valid?/1 returns false when password has no special characters" do
    assert Validator.valid?("AbTp9!fok")
    assert Validator.valid?("AbTp9_fok")
    refute Validator.valid?("AbTp91fok")
  end

  test "valid?/1 returns false when password has repeated characters" do
    refute Validator.valid?("AAAbbbCc")
    refute Validator.valid?("AbTp9!foo")
    assert Validator.valid?("AbTp9!fok")
  end
end

# Nove ou mais caracteres
# Ao menos 1 dígito
# Ao menos 1 letra minúscula
# Ao menos 1 letra maiúscula
# Ao menos 1 caractere especial
# Não possuir caracteres repetidos
