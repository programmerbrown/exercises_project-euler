defmodule Problem3 do
  def largest_prime_factor(num \\ 600_851_475_143) do
    2..round(:math.sqrt(num))
    |> Enum.filter(fn x -> rem(num, x) == 0 end)
    |> Enum.flat_map(fn x -> [x, div(num, x)] end)
    |> Enum.filter(&prime?(&1))
    |> Enum.max()
  end

  def prime?(x) when x == 2, do: true
  def prime?(x) do
    Enum.all?(2..round(:math.sqrt(x)), fn n -> rem(x, n) != 0 end)
  end
end
