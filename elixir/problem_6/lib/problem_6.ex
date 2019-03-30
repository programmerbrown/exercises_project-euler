defmodule Problem6 do
  def sum_square_diff(n \\ 100) do
    sum_of_squares = 1..n |> Enum.map(fn x -> :math.pow(x, 2) end) |> Enum.map(&round(&1)) |> Enum.sum() 
    square_of_sum = 1..n |> Enum.sum() |> :math.pow(2) |> round()
    square_of_sum - sum_of_squares
  end
end
