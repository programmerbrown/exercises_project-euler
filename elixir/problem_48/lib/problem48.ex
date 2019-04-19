defmodule Problem48 do
  def last_ten_digits(max \\ 1000) do
    1..max
    |> Enum.map(fn x -> pow(x, x) end)
    |> Enum.sum()
    |> Integer.digits()
    |> Enum.reverse()
    |> Enum.take(10)
    |> Enum.reverse()
    |> Integer.undigits()
  end

  def pow(_x, 0), do: 1
  def pow(x, 1), do: x

  def pow(x, y) do
    x * pow(x, y - 1)
  end
end
