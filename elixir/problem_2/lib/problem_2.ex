defmodule Problem2 do
    def sum_even_fib_nums(max \\ 4_000_000) do
      fib_seq(max)
      |> Enum.filter(fn x -> rem(x,2) == 0 end)
      |> Enum.sum()
    end

    def fib_seq(max \\ 1_000) do
      Stream.iterate(0, &(&1 + 1)) 
      |> Stream.map(&fib_num(&1)) 
      |> Stream.take_while(&(&1 < max))
      |> Enum.to_list
    end

    def fib_num(0), do: 0
    def fib_num(1), do: 1
    def fib_num(2), do: 1
    def fib_num(n), do: fib_num(n, 1, 1)

    defp fib_num(3, previous, current), do: current + previous
    defp fib_num(n, previous, current), do: fib_num(n - 1, current, previous + current)
end
