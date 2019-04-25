defmodule Problem49 do
  def find_all() do
    1000..9999
    |> Enum.filter(&match_condition?(&1))
    |> Enum.map(&find_add_term(&1))
  end

  def match_condition?(num) do
    1000..9999
    |> Enum.any?(&match_condition?(&1, num))
  end

  def match_condition?(add_num, num) do
    num_arr_1 = num |> Integer.digits() |> Enum.sort()
    num_arr_2 = (num + add_num) |> Integer.digits() |> Enum.sort()
    num_arr_3 = (num + 2 * add_num) |> Integer.digits() |> Enum.sort()

    num_arr_1 == num_arr_2 and num_arr_2 == num_arr_3 and
      prime?(num) and prime?(num + add_num) and prime?(num + 2 * add_num)
  end

  def find_add_term(num) do
    add_term =
      1000..9999
      |> Enum.filter(&match_condition?(&1, num))
      |> hd()

    {num, add_term}
  end

  def prime?(x) when x == 2, do: true

  def prime?(x) do
    Enum.all?(2..round(:math.sqrt(x)), fn n -> rem(x, n) != 0 end)
  end
end
