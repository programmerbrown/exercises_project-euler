defmodule Problem40 do
  @indices [1, 10, 100, 1000, 10_000, 100_000, 1_000_000]
  
  def evaluate() do
    1..1_000_000
    |> Enum.flat_map(fn num -> Integer.digits(num) end)
    |> Enum.with_index(1)
    |> Enum.filter(fn {_num, index} -> index in @indices end)
    |> Enum.reduce(1, fn {num, _index}, acc -> num * acc end)
  end
end
