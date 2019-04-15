defmodule Problem34 do
  # Upper Bound:
  # start with number 9:
  # 9! = 362880 > 9
  # 2 * 9! =  725760 > 99
  # 3 * 9! = 1088640 > 999
  # 4 * 9! = 1451520 > 9999
  # 5 * 9! = 1814400 > 99999
  # 6 * 9! = 2177280 > 999999
  # 7 * 9! = 2540160 < 9999999
  # 
  # 2540160 is our upper bound.
  
  def sum() do
    3..2540160
    |> Enum.filter(fn x -> sum_fact_digits(x) == x end)
    |> Enum.sum()
  end

  def sum_fact_digits(num) do
    num
    |> Integer.digits()
    |> Enum.map(fn x -> factorial(x) end)
    |> Enum.sum()
  end

  def factorial(0), do: 1
  def factorial(1), do: 1

  def factorial(n) do
    n * factorial(n - 1)
  end
end
