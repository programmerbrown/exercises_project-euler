defmodule Problem19 do
  def calc_sundays() do
    dates = dates()
    Enum.count(dates, fn date_tuple -> sunday?(date_tuple) end)  
  end

  def dates() do
    for year <- 1901..2000, month <- 1..12 do
      Date.new(year, month, 1)
    end
  end

  def sunday?({:ok, date}) do
    Date.day_of_week(date) == 7
  end
end
