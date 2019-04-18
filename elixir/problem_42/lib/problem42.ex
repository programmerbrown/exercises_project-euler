defmodule Problem42 do
  @alpha %{
    "A" => 1,
    "B" => 2,
    "C" => 3,
    "D" => 4,
    "E" => 5,
    "F" => 6,
    "G" => 7,
    "H" => 8,
    "I" => 9,
    "J" => 10,
    "K" => 11,
    "L" => 12,
    "M" => 13,
    "N" => 14,
    "O" => 15,
    "P" => 16,
    "Q" => 17,
    "R" => 18,
    "S" => 19,
    "T" => 20,
    "U" => 21,
    "V" => 22,
    "W" => 23,
    "X" => 24,
    "Y" => 25,
    "Z" => 26
  }

  def count_triangle_words() do
    word_sequence()
    |> Enum.map(&word_score(&1))
    |> Enum.count(&triangle_word?(&1))
  end

  def word_sequence() do
    File.read!("words.txt")
    |> String.replace("\"", "")
    |> String.split(",")
  end

  def word_score(word) do
      word
      |> String.split("", trim: true)
      |> Enum.map(fn letter -> Map.get(@alpha, letter) end)
      |> Enum.sum()
  end

  def triangle_word?(num) do
      1..num
      |> Enum.map(fn x -> round(x * (x + 1) / 2) end)
      |> Enum.take_while(fn x -> x <= num end)
      |> Enum.member?(num)
  end
end
