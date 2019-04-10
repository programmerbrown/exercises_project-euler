defmodule Problem35 do
  def num_circ_primes(max \\ 1_000_000) do
    1..(max - 1)
    |> Enum.count(&circular_prime?(&1))
  end

  def circular_prime?(num) do
    size =
      num
      |> Integer.to_string()
      |> String.length()

    num
    |> Integer.digits()
    |> Stream.cycle()
    |> Enum.take(2 * size)
    |> Enum.chunk_every(size, 1, :discard)
    |> Enum.map(&Integer.undigits(&1))
    |> Enum.uniq()
    |> Enum.all?(&prime?(&1))
  end

  def prime?(1), do: false
  def prime?(2), do: true

  def prime?(x) do
    Enum.all?(2..round(:math.sqrt(x)), fn n -> rem(x, n) != 0 end)
  end
end
