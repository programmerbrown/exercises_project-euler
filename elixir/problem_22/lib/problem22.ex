defmodule Problem22 do
  @alpha %{"A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10, 
           "K" => 11, "L" => 12, "M" => 13, "N" => 14, "O" => 15, "P" => 16, "Q" => 17, "R" => 18, "S" => 19, "T" => 20, 
           "U" => 21, "V" => 22, "W" => 23, "X" => 24, "Y" => 25, "Z" => 26}

  def total_name_score() do
    name_sequence()
    |> Enum.sort()
    |> Enum.with_index(1)
    |> Enum.map(&(name_score(&1)))
    |> Enum.sum()
  end
  
  def name_sequence() do
    File.read!("names.txt")
    |> String.replace("\"","")
    |> String.split(",")
  end

  def name_score({name, position}) do
    alpha_score = name
                  |> String.split("", trim: true)
                  |> Enum.map(fn letter -> Map.get(@alpha, letter) end)
                  |> Enum.sum()

    alpha_score * position 
  end
end
