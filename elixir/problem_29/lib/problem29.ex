defmodule Problem29 do
  def distinct_terms(max_base, max_exponent) do
    sequence(max_base, max_exponent)
    |> Enum.uniq()
    |> length()
  end

  def sequence(max_base, max_exponent) do
    for base <- 2..max_base, exponent <- 2..max_exponent do
      :math.pow(base, exponent) |> round()
    end
  end
end
