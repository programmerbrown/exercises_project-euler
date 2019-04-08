defmodule Problem31 do
  def calc() do
    length(combo_list())
  end

  def combo_list() do
    for a <- 0..1, b <- 0..2, c <- 0..4, d <- 0..10, e <- 0..20, f <- 0..40, g <- 0..100, check_sum(a, b, c, d, e, f, g) do
      {a, b, c, d, e, f, g, compute_pence(a, b, c, d, e, f, g)}
    end
  end

  def compute_pence(a, b, c, d, e, f, g) do
    200 - (200 * a) - (100 * b) - (50 * c) - (20 * d) - (10 * e) - (5 * f) - (2 * g)
  end

  def check_sum(a, b, c, d, e, f, g) do
    (200 * a) + (100 * b) + (50 * c) + (20 * d) + (10 * e) + (5 * f) + (2 * g) <= 200
  end
end
