defmodule Problem37 do
  def sum_trunc_primes() do
    sequence()
    |> Stream.filter(&trunctable?(&1))
    |> Enum.take(11)
    |> Enum.sum()
  end

  def sequence() do
    Stream.iterate(8, &(&1 + 1))
  end

  def trunctable?(num) do
    left_trunctable?(num) and right_trunctable?(num)
  end

  def left_trunctable?(num) do
    num
    |> Integer.digits()
    |> left_trunctable_test()
  end

  def right_trunctable?(num) do
    num
    |> Integer.digits()
    |> right_trunctable_test()
  end

  def left_trunctable_test([]), do: true

  def left_trunctable_test(list) do
    num = Integer.undigits(list)

    if prime?(num) do
      num
      |> Integer.digits()
      |> List.delete_at(0)
      |> left_trunctable_test()
    else
      false
    end
  end

  def right_trunctable_test([]), do: true

  def right_trunctable_test(list) do
    num = Integer.undigits(list)

    if prime?(num) do
      num
      |> Integer.digits()
      |> List.delete_at(-1)
      |> right_trunctable_test()
    else
      false
    end
  end

  def prime?(0), do: false
  def prime?(1), do: false
  def prime?(2), do: true

  def prime?(x) do
    Enum.all?(2..round(:math.sqrt(x)), fn n -> rem(x, n) != 0 end)
  end
end
