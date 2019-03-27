defmodule Problem14 do
  def longest_collatz_seq(max \\ 1_000_000) do
    1..max-1
    |> Enum.filter(fn x -> x < max end)
    |> Enum.to_list()
    |> Enum.max_by(fn x -> collatz_seq_cnt(x) end)
  end

  def collatz_seq_cnt(1), do: 1
  def collatz_seq_cnt(n) when rem(n, 2) == 0, do: collatz_seq_cnt(div(n, 2), 1)
  def collatz_seq_cnt(n), do: collatz_seq_cnt(3*n + 1, 1)

  defp collatz_seq_cnt(1, count), do: count + 1
  defp collatz_seq_cnt(n, count) when rem(n, 2) == 0, do: collatz_seq_cnt(div(n, 2), count + 1)
  defp collatz_seq_cnt(n, count), do:collatz_seq_cnt(3*n + 1, count + 1)
end
