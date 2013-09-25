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

  # Exercise: ListsAndRecursion-5

  # .all?
  # MyList.all?([1,2,3], &(&1 > 2)) # => false
  # MyList.all?([1,2,3], &(&1 < 5)) # => true
  def all?([], _fun), do: true
  def all?([head | tail], fun), do: fun.(head) && all?(tail, fun)

  # .each
  # MyList.each [1,2,3], &(IO.puts "#{&1}")
  # 1
  # 2
  # 3
  # :ok
  def each([], _fun), do: :ok
  def each([ head | tail ], fun) do
    fun.(head)
    each(tail, fun)
  end

  # .filter
  # MyList.filter [1,2,3,4], &(&1 > 2) # => [3,4]
  def filter([], _fun), do: []
  def filter([ head | tail ], fun) do
    if fun.(head) do
      [ head | filter(tail, fun) ]
    else
      filter(tail, fun)
    end
  end

  # .split
  # MyList.split([1, 2, 3], 2)
  # { [1,2], [3] }
  # MyList.split([1, 2, 3], 10)
  # { [1,2,3], [] }
  # MyList.split([1, 2, 3], 0)
  # { [], [1,2,3] }
  # MyList.split([1, 2, 3], -1)
  # { [1,2], [3] }
  # MyList.split([1, 2, 3], -5)
  # { [], [1,2,3] }
  def split(collection, count) do
    _split(collection, count, { [], [] })
  end

  defp _split([], _count, result), do: result
  defp _split(collection, count, result) when count < 0 and abs(count) <= length(collection) do
    _split(collection, length(collection) + count, result)
  end
  defp _split([ head | tail ], count, { left, right }) when length(left) < count do
    _split(tail, count, { left ++ [head], right })
  end
  defp _split([ head | tail ], count, { left, right }) do
    _split(tail, count, { left, right ++ [head] })
  end

  # .take
  # MyList.take([1, 2, 3], 2)
  # [1,2]
  # MyList.take([1, 2, 3], 10)
  # [1,2,3]
  # MyList.take([1, 2, 3], 0)
  # []
  # MyList.take([1, 2, 3], -1)
  # [1,2]
  def take(collection, count), do: _take(collection, count, [])

  defp _take([], _, result), do: result
  defp _take(_, count, result) when length(result) == count, do: result
  defp _take(collection, count, result) when count < 0 do
    _take(collection, length(collection) + count, result)
  end
  defp _take([ head | tail], count, result) do
    _take(tail, count, result ++ [head])
  end

  # Exercise: ListsAndRecursion-6
  #
  # .flatten(list)
  # MyList.flatten([1,[2]])
  # [1,2]
  # MyList.flatten([1,[2,3,[4]], 5, [[[6]]]])
  # [1,2,3,4,5,6]
  # MyList.flatten([])
  # []
  # MyList.flatten([1,[]])
  # [1]
  def flatten(list), do: _flatten(list, [])

  defp _flatten([], result), do: result
  defp _flatten([ head | tail ], result) when is_list(head) do
    _flatten(tail, _flatten(head, result))
  end
  defp _flatten([ head | tail ], result) do
    _flatten(tail, result ++ [head])
  end

  # Exercise: ListsAndRecursion-7
  #
  # MyList.prime_from_2_to(10)
  # [2,3,5,7]
  def prime_from_2_to(n) do
    range = span(2,n)
    range -- (lc x inlist range, y inlist range, x > y, rem(x,y) == 0, do: x)
  end
end
