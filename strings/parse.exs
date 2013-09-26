defmodule Parse do
  # Exercise: StringsAndBinaries-1
  #
  # space = ASCII 32
  # tilde = ASCII 126
  #
  # MyString.printable?('abcdefgh') # => true
  # MyString.printable?('abcdefgh\t') # => false
  # MyString.printable?([97,98,99]) # => true
  # MyString.printable?([97,98,99,0]) # => false
  def printable?(str), do: Enum.all?(str, &(&1 >= ?\s && &1 <= ?~))

  # Exercise: StringsAndBinaries-2
  #
  # MyString.anagram?('stop', 'pots') # => true
  # MyString.anagram?('this', 'not') #=> false
  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

  # Exercise: StringsAndBinaries-4
  #
  # MyString.calculate('123 + 27') # => 150
  def calculate(str) do
    [left, operator, right] = Enum.chunks_by(str, &(&1 == ?\s)) |>
      Enum.reject &(&1 == ' ')

    _calculate(number(left), operator, number(right))
  end

  defp _calculate(left, op, right) when op == '+', do: left + right
  defp _calculate(left, op, right) when op == '-', do: left - right
  defp _calculate(left, op, right) when op == '*', do: left * right
  defp _calculate(left, op, right) when op == '/', do: left / right

  def number(str), do: _number_digits(str, 0)

  defp _number_digits([], value), do: value
  defp _number_digits([ digit | tail ], value) when digit in '0123456789' do
    _number_digits(tail, value*10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end
end
