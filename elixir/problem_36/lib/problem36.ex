defmodule Problem36 do
  def sum_palindromes() do
    1..999_999
    |> Enum.filter(fn num -> palindrome_binary?(num) and palindrome_decimal?(num) end)
    |> Enum.sum()
  end

  def palindrome_binary?(num) do
    binary = Integer.to_string(num, 2)

    binary == String.reverse(binary)
  end

  def palindrome_decimal?(num) do
    num_str = Integer.to_string(num)

    num_str == String.reverse(num_str)
  end
end
