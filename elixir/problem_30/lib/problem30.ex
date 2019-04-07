defmodule Problem30 do
  def sum(exp \\ 5) do
    sequence()
    |> Enum.filter(&equal_fifth_power_of_digits?(&1, exp))
    |> Enum.sum()
  end

  def sequence() do
    2..354_294 # This range only works for exponents 5 and less
  end

  def equal_fifth_power_of_digits?(num, exp) do
    num == sum_of_fifth_pow_of_digits(num, exp)
  end

  def sum_of_fifth_pow_of_digits(num, exp) do
    num 
    |> Integer.digits()
    |> Enum.map(fn x -> :math.pow(x, exp) end)
    |> Enum.sum()
  end
end
