defmodule FizzBuzz do
  def run(range), do: Enum.map(range, &(_fizz_buzz(&1)))

  defp _fizz_buzz(n), do: _tester(rem(n,3), rem(n,5), n)

  defp _tester(0,0,_), do: "FizzBuzz"
  defp _tester(0,_,_), do: "Fizz"
  defp _tester(_,0,_), do: "Buzz"
  defp _tester(_,_,n), do: n
end
