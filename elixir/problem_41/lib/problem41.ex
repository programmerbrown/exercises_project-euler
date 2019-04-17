defmodule Problem41 do
  def largest_pandigital_prime() do
    # LINK: https://math.stackexchange.com/questions/957978/finding-if-a-number-is-prime-by-looking-at-the-sum-of-their-digits
    # "So if a number's digit sum is divisible by 3 that means the number itself is also divisible by 3. 
    #  No primes (other than 3) are divisible by 3. So you have a way to prove a number is not prime, 
    #  but not a way to prove that it is prime."
    # 
    # The sum of the digits of a 9-digit pandigital number (ex. 987214536) is 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 = 45.
    # Since the sum of the digits of a 9-digit pandigital number is divisible by 3, no 9-digit pandigital number is primal.
    # 
    # This is also the case for an 8-digit pandigital number (ex. 87214536). The sum of the digits of 
    # a 8-digit pandigital number is 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 = 36. Since this sum is divisible by 3, it follows that
    # all 8-digit pandigital numbers are not prime.

    Stream.iterate(7_654_321, &(&1 - 1))
    |> Stream.filter(fn n -> pandigital?(n) and prime?(n) end)
    |> Enum.take(1)
    |> hd()
  end

  def pandigital?(num) do
    size =
      num
      |> Integer.to_string()
      |> String.length()

    uniq_digits =
      num
      |> Integer.digits()
      |> Enum.uniq()

    all_digits_present? =
      uniq_digits
      |> Enum.all?(fn x -> Enum.member?(1..size, x) end)
    
    all_digits_present? and length(uniq_digits) == size
  end

  def prime?(1), do: false
  def prime?(2), do: true

  def prime?(x) do
    Enum.all?(2..round(:math.sqrt(x)), fn n -> rem(x, n) != 0 end)
  end
end
