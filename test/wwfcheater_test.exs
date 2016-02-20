defmodule WwfcheaterTest do
  use ExUnit.Case
  doctest Wwfcheater

  test "pick" do
    assert Wwfcheater.pick('', '') == ''
    assert Wwfcheater.pick('abc', '') == ''
    assert Wwfcheater.pick('abc', 'd') == ''
    assert Wwfcheater.pick('abc', 'b') == 'b'
    assert Wwfcheater.pick('abcabc', 'abc') == 'abc'
    assert Wwfcheater.pick('acb', 'abcabc') == 'abc'
    assert Wwfcheater.pick('axxxcb', 'abcabc') == 'abc'
    assert Wwfcheater.pick('muebjl', 'jumble') == 'jumble'
    refute Wwfcheater.pick('muebjl', 'mumble') == 'mumble'
  end

  test "match" do
    assert Wwfcheater.match('', '') == true
    assert Wwfcheater.match('abc', '') == true
    assert Wwfcheater.match('abc', 'abc') == true
    assert Wwfcheater.match('', 'abc') == false
    assert Wwfcheater.match('abc', 'def') == false
    assert Wwfcheater.match('muebjl', 'jumble') == true
  end

  test "find" do
    words = Wwfcheater.make_dict("words.txt")
    matches = Wwfcheater.find('ujmebl', words)
    assert Enum.member? matches, 'jumble'
    refute Enum.member? matches, 'mumble'
    refute Enum.member? matches, 'bell'
  end

  test "learning some Elixir" do
    assert "jumble" == "jumble"
    refute 'jumble' == "jumble"
    assert 'jumble' == "jumble" |> to_char_list
    assert 'jumble' |> Enum.sort == 'bejlmu'
  end
end
