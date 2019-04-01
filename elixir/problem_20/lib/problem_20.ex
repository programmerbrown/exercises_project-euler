defmodule Problem20 do
  def factorial(0), do: 1
  def factorial(1), do: 1
  def factorial(n), do: n * factorial(n - 1)

  def sum_fact_digits(n) do
    factorial(n)
    |> Integer.digits()
    |> Enum.sum()
  end
end
