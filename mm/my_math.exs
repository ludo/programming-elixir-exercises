defmodule MyMath do
  # ModulesAndFunctions-4
  # sum(1) # => 1
  # sum(2) # => 2 + 1 = 3
  # sum(3) # => 3 + 2 + 1 = 6
  def sum(1), do: 1
  def sum(n), do: n + sum(n-1)


  # ModulesAndFunctions-5
  # gcd(1,2) # => 1
  # gcd(5,25) # => 5
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x,y))
end
