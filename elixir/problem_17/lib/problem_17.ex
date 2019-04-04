defmodule Problem17 do
  @ones %{ 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine" }
  @teens %{ 1 => "eleven", 2 => "twelve", 3 => "thirteen", 4 => "fourteen", 5 => "fifteen", 6 => "sixteen", 7 => "seventeen", 8 => "eighteen", 9 => "nineteen" }
  @tens %{ 1 => "ten", 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty",6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety" }

  def counting_letters(nums \\ 1..1000) do
    nums
    |> Enum.map(&(num_to_word/1))
    |> Enum.map(&(letter_count/1))
    |> Enum.sum()
  end

  def num_to_word(num) do
      Integer.digits(num) 
      |> word_scenario()
  end

  def word_scenario([1, _b, _c, _d]), do: "one thousand"
  def word_scenario([a, 0, 0]), do: Map.get(@ones, a) <> " hundred"
  def word_scenario([a, 0, c]), do: Map.get(@ones, a) <> " hundred and " <> Map.get(@ones, c)
  def word_scenario([a, b, 0]), do: Map.get(@ones, a) <> " hundred and " <> Map.get(@tens, b)
  def word_scenario([a, 1, c]), do: Map.get(@ones, a) <> " hundred and " <> Map.get(@teens, c)
  def word_scenario([a, b, c]), do: Map.get(@ones, a) <> " hundred and " <> Map.get(@tens, b) <> " " <> Map.get(@ones, c)
  def word_scenario([a, 0]), do: Map.get(@tens, a)
  def word_scenario([1, b]), do: Map.get(@teens, b)
  def word_scenario([a, b]), do: Map.get(@tens, a) <> " " <> Map.get(@ones, b)
  def word_scenario([a]), do: Map.get(@ones, a)

  defp letter_count(word) do
    word
    |> String.replace(" ", "") 
    |> String.length()
  end
end
