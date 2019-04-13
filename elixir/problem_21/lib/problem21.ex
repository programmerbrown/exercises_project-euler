defmodule Problem21 do
  def sum_amicable_numbers(max \\ 10_000) do
    list = Enum.map(2..max, fn x -> {x, sum_divisors(x)} end)

    list
    |> Enum.filter(fn {x, y} -> {y, x} in list and x != y end)
    |> Enum.map(fn {x, _y} -> x end)
    |> Enum.sum()
  end

  def sum_divisors(num) do
    1..num-1
    |> Enum.filter(fn x -> rem(num, x) == 0 end)
    |> Enum.sum()
  end
end
