defmodule Wwfcheater do
  def pick(tiles, word), do: pick(tiles, word, '')
  def pick(tiles, word, accumulator) when tiles == '' or word == '' do
    accumulator
  end
  def pick(tiles, [char | chars], accumulator) do
    cond do
      Enum.member?(tiles, char) ->
        pick(tiles -- [char], chars, accumulator ++ [char])
      true ->
        pick(tiles, chars, accumulator)
    end
  end

  def match(tiles, word) do
    word == pick(tiles, word)
  end

  def make_dict(file) do
    {:ok, dict} = File.read(file)
    dict |> String.split("\n") |>
      Enum.map fn word ->
        to_char_list word
      end
  end

  def find(tiles, words) do
    Enum.filter words, fn word -> match tiles, word end
  end
end
