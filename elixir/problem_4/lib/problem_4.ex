defmodule Problem4 do
  def calc_large_palindrome() do
    create_multiplicative_list()
    |> Enum.filter(&(palindrome?(&1)))
    |> Enum.max()
  end

  defp create_multiplicative_list() do
    for i <- 100..999, j <- 100..999 do
      i * j
    end
  end

  defp palindrome?(num) do
    str = Integer.to_string(num)

    str == String.reverse(str)
  end
end
