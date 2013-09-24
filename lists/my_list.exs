defmodule MyList do
  def map([], _fun), do: []
  def map([ head | tail ], fun), do: [ fun.(head) | map(tail, fun) ]

  # Exercise: ListsAndRecursion-0
  #
  # MyList.sum([1,2,3]) # => 6

  def sum([ head | [] ]), do: head
  def sum([ head | [ next_head | tail ] ]), do: sum([ head + next_head | tail ])

  def sum1([]), do: 0
  def sum1([ head | tail ]), do: head + sum1(tail)

  # Exercise: ListsAndRecursion-1
  #
  # MyList.mapsum [1,2,3], &(&1 * &1) # => 14
  def mapsum(list, fun), do: sum1(map(list, fun))

  # Exercise: ListsAndRecursion-2
  #
  # MyList.max [3,6,4,2] # => 6
  def max(list = [ head | _ ]), do: _max(list, head)

  defp _max([], cur_max), do: cur_max
  defp _max([ head | tail ], cur_max) when head > cur_max, do: _max(tail, head)
  defp _max([ _head | tail ], cur_max), do: _max(tail, cur_max)

  # Exercise: ListsAndRecursion-3
  #
  # MyList.caesar 'ryvkve', 13) # => 'elixir'
  # a = 97, z = 122
  def caesar([], _), do: []
  def caesar([ head | tail ], shift), do: [ _encrypt_char(head, shift) | caesar(tail, shift)]

  defp _encrypt_char(chr, shift) when chr + shift > ?z, do: chr + shift - 26
  defp _encrypt_char(chr, shift), do: chr + shift

  # Exercise: ListsAndRecursion-4
  #
  # MyList.span(3, 6) # => [3,4,5,6]
  def span(from, to), do: Enum.reverse _span(from, to - from, [from])

  def _span(_from, 0, result), do: result
  def _span(from, len, result), do: [from + len | _span(from, len - 1, result)]

  def span1(from, to) when from > to, do: []
  def span1(from, to), do: [from | span1(from + 1, to)]
end
