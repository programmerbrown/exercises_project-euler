defmodule Problem12 do

  def num_of_factors_greater_than(max \\ 500) do
    triangle_seq()
    |> Stream.filter(fn x -> num_of_factors(x) > max end)
    |> Enum.take(1)
    |> Enum.sum()
  end

  def triangle_seq() do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.scan(&(&1 + &2))
  end

  def num_of_factors(n) do
    cond do
      n == 1 -> 1
      true   -> Enum.count(1..round(:math.sqrt(n)), fn i -> rem(n, i) == 0 end) * 2
    end
  end
end
