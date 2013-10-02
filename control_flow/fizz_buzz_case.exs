# Exercise: ControlFlow-2
defmodule FizzBuzz do
  def upto(n), do: Enum.map(1..n, &(_fizz_buzz(&1)))

  defp _fizz_buzz(n) do
    case { rem(n,3), rem(n,5) } do
      { 0, 0 } -> "FizzBuzz"
      { 0, _ } -> "Fizz"
      { _, 0 } -> "Buzz"
      _ -> n
    end
  end
end
