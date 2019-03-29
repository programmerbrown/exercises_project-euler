defmodule Problem17 do
  @ones_table %{  1 => "one", 
                  2 => "two", 
                  3 => "three", 
                  4 => "four", 
                  5 => "five", 
                  6 => "six", 
                  7 => "seven", 
                  8 => "eight", 
                  9 => "nine"  }

  @tens_table %{ 1 => "ten", 
                 11 => "eleven", 
                 12 => "twelve", 
                 13 => "thirteen", 
                 14 => "fourteen", 
                 15 => "fifteen", 
                 16 => "sixteen", 
                 17 => "seventeen", 
                 18 => "eighteen", 
                 19 => "nineteen",
                 2 => "twenty", 
                 3 => "thirty", 
                 4 => "forty", 
                 5 => "fifty",
                 6 => "sixty", 
                 7 => "seventy", 
                 8 => "eighty", 
                 9 => "ninety"  }

  def counting_letters(nums \\ 1..1000) do
    nums
    |> Enum.map(&(num_to_word/1))
    |> Enum.map(&(letter_count/1))
    |> Enum.sum()
  end

  def num_to_word(num) do
      [ a, b, c, d ] = Integer.digits(num) |> pad_list()
      
      cond do
        a == 1 -> 
          get_thousands(a)
        b > 0 and c == 0 and d == 0 -> 
          get_hundreds(b)
        b > 0 and c == 0 and d > 0 -> 
          get_hundreds(b) <> " and " <> get_ones(d)
        b > 0 and c > 0 and d == 0 -> 
          get_hundreds(b) <> " and " <> get_tens(c)
        b > 0 and c == 1 and d > 0 -> 
          get_hundreds(b) <> " and " <> ([c, d] |> Integer.undigits() |> get_tens())
        b > 0 and c > 0 and d > 0 -> 
          get_hundreds(b) <> " and " <> get_tens(c) <> " " <> get_ones(d)
        b == 0 and c == 1 and d > 0 -> 
          [c, d] |> Integer.undigits() |> get_tens()
        b == 0 and c > 0 and d > 0 -> 
          get_tens(c) <> " " <> get_ones(d)
        b == 0 and c > 0 and d == 0 ->
          get_tens(c)
        b == 0 and c == 0 and d > 0 -> 
          get_ones(d)
      end
  end

  defp pad_list(list) do
    cond do
      length(list) == 1 -> [ 0, 0, 0 | list ]
      length(list) == 2 -> [ 0, 0 | list ]
      length(list) == 3 -> [ 0 | list ]
      true -> list
    end
  end

  defp get_thousands(digit) do
    if digit == 1, do: "one thousand"
  end

  defp get_hundreds(digit) do
    if digit > 0, do: Map.get(@ones_table, digit) <> " hundred"
  end

  defp get_tens(digit) do
    if digit > 0, do: Map.get(@tens_table, digit)
  end

  defp get_ones(digit) do
    if digit > 0, do: Map.get(@ones_table, digit)
  end

  defp letter_count(word) do
    word
    |> String.replace(" ", "") 
    |> String.length()
  end
end
