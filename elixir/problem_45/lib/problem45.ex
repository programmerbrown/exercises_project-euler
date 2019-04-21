defmodule Problem45 do
  def next_match() do
    286..1_000_000
    |> Enum.map(fn x -> round(x * (x + 1) / 2) end)
    |> Enum.filter(fn x -> pentagonal?(x) and hexagonal?(x) end)
    |> Enum.take(1)
    |> hd()
  end

  def pentagonal?(num) do
    index = (:math.sqrt(24 * num + 1) + 1) / 6

    index == round(index)
  end

  def hexagonal?(num) do
    index = (:math.sqrt(8 * num + 1) + 1) / 4

    index == round(index)
  end
end