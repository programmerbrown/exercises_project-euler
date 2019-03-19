defmodule Primes do
    @doc """
    I got my solution from the solution provided the following GitHub repo:
    https://github.com/sorentwo/euler/blob/master/lib/euler_010.exs
    """
    def sum_of_primes(max \\ 2_000_000) do
        sequence()
        |> Stream.filter(&prime?/1)
        |> Stream.take_while(&(&1 < max))
        |> Enum.reduce(0, fn x, acc -> x + acc end)
        |> print_answer(max)
    end

    def sequence() do
        Stream.iterate(0, &(&1 + 1))
    end

    def prime?(x) when x == 2, do: true
    def prime?(x) do
        Enum.all?((2..round(:math.sqrt(x))), fn n -> rem(x, n) != 0 end)
    end

    def print_answer(x, y) do
        IO.puts "The sum of all the primes below #{y} is : #{x}"
    end
end