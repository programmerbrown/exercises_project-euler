defmodule Problem32 do
  @digits [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def sum_product() do
    product_sequence()
    |> Enum.uniq()
    |> Enum.sum()
  end

  def product_sequence() do
    for i <- 1..999, j <- 9999..10, pandigital?(i, j) do
      i * j
    end
  end

  def pandigital?(m, n) do
    digits = [m, n, m * n] |> Enum.flat_map(&(Integer.digits(&1)))

    uniq_digits = digits |> Enum.uniq()
    digits_present = Enum.all?(digits, fn d -> d in @digits end)

    digits_present and length(uniq_digits) == 9 and length(digits) == 9
  end
end
