defmodule Multiple do
    def smallest_multiple() do
        sequence()
        |> Stream.filter(&divisible?/1)
        |> Stream.take(1)
        |> Enum.to_list()
        |> print_answer()
    end

    defp sequence() do
        Stream.iterate(1, &(&1 + 1))
    end

    defp divisible?(n) do
        Enum.all?(1..20, fn i -> rem(n,i) == 0 end)
    end

    defp print_answer([ head | _ ]) do
        IO.puts "The smallest number divisible by 1 through 20 is : #{head}"
    end
end