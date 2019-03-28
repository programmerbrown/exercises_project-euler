defmodule Problem16 do
  def sum_power_digits(x, y) do
    :math.pow(x, y) 
    |> round()
    |> Integer.digits()
    |> Enum.sum()
  end
end
