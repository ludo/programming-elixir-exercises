defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head|tail]), do: [ head*head | square(tail) ]

  def add_1([]), do: []
  def add_1([head|tail]), do: [ head+1 | add_1(tail) ]

  def map([], _func), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]


  def sum(list), do: _sum(list, 0)

  # private methods
  defp _sum([], total), do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head + total)

  def reduce([], value, _), do: value
  def reduce([head | tail], value, fun), do: reduce(tail, fun.(head, value), fun)

  # MyList.mapsum [1,2,3], &1 * &1
  def mapsum(list, fun), do: map(list, fun) |> sum

  def max(list), do: _max(list, 0)

  defp _max(list, currentMax) when list == [], do: currentMax
  defp _max([head | tail], currentMax) when head > currentMax do
    _max tail, head
  end
  defp _max([head | tail], currentMax) when head <= currentMax do
    _max tail, currentMax
  end

  def caesar(list, n), do: to_char_list _caesar(list, n)

  defp _caesar([], _n), do: []
  defp _caesar([head | tail], n) do
    [_scramble_char(head, rem(n, 26))] ++ _caesar(tail, n)
  end

  # min 97 (a), max 122 (z)
  # What if n > 26?
  defp _scramble_char(char, n) when char + n <= 122 , do: char + n
  defp _scramble_char(char, n) when char + n > 122, do: char + n - 122 + 97

  # MyList.flatten([1,[2,3,[4]],5,[[[6]]]])
  # MyList.flatten([1,[2]])
  def flatten(list) do
    _flatten list
  end

  defp _flatten([]), do: []
  defp _flatten(list = [head | tail]) when is_list(list) do
    _flatten(head) ++ _flatten(tail)
  end
  defp _flatten(list) when !is_list(list) do
    [list]
  end
end
