defmodule Multiples do
    def sum(1..n) do
        1..n-1
        |> Enum.filter(fn x -> Integer.mod(x, 3) == 0 or Integer.mod(x, 5) == 0 end)
        |> Enum.reduce(fn x, acc -> x + acc end)
        |> print_answer(n)
    end

    def print_answer(x, y) do
        IO.puts "The sum of the numbers divisible by 3 and 5 below #{y} is : #{x}"
    end
end