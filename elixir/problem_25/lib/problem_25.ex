defmodule Problem25 do
    def num_with_digits(max \\ 1_000) do
      fib_seq()
      |> Stream.filter(&(num_of_digits(&1, max)))
      |> Enum.take(1)
      |> hd()
      |> elem(0)
    end

    def num_of_digits({_index, num}, max) do
      Integer.digits(num) |> length() >= max
    end

    def fib_seq() do
      Stream.iterate(1, &(&1 + 1)) 
      |> Stream.map(&fib_num(&1))
    end

    def fib_num(1), do: {1, 1}
    def fib_num(2), do: {2, 1}
    def fib_num(n), do: fib_num(n, n, 1, 1)

    defp fib_num(m, 3, previous, current), do: {m, current + previous}
    defp fib_num(m, n, previous, current), do: fib_num(m, n - 1, current, previous + current)
end
