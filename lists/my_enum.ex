defmodule MyEnum do
  # all?(collection[, fn])
  #   Passes each element to the function, returning false if the function ever returns false or nil. The default function is the identity function.
  # iex> Enum.all? [1,2,3]
  #   true
  # iex> Enum.all? [1,nil,3]
  #   false
  # iex> Enum.all? [2,4,100], fn n -> rem(n, 2) == 0 end
  #   true
  def all?(collection, fun), do: _all?(collection, fun, true)

  defp _all?(_, _, false), do: false
  defp _all?([], _, true), do: true
  defp _all?([ head | tail ], fun, true), do: _all?(tail, fun, fun.(head))

  # each(collection, fn)
  #   Pass each element of the collection to fn.
  # iex> Enum.each [9,8], IO.puts(&1)
  #   9
  #   8
  def each([ head | tail], fun), do: [ fun.(head) ] ++ each(tail, fun)
  def each([], _), do: []

  # filter(collection, fn)
  #   Returns a list containing only those elements for which fn returns true.
  # iex> Enum.filter [9,8,7,6,5], fn x -> rem(x, 2) == 0 end
  #   [8,6]
  def filter(collection, fun) do
    each(collection, fun) # HMMM????
  end

  # split(collection, n)
  #   Returns a tuple when the first element is the first n elements from collection, and the second is the remainder. In n is negative, counts down from the end of the collection.
  # iex> Enum.split [1,2,3,4,5,6], 4
  #   {[1,2,3,4],[5,6]}
  def split(collection, n) do
    _split(collection, n, { [], [] }, 0)
  end

  defp _split([], _, result, _), do: result
  defp _split([ head | tail ], n, { left, right }, count) when count < n do
    _split(tail, n, { left ++ [head], right }, count + 1)
  end
  defp _split([ head | tail ], n, { left, right }, count) when count >= n do
    _split(tail, n, { left, right ++ [head] }, count + 1)
  end

  # take(collection, n)
  #   Return the first n elements from the collection.
  # iex> Enum.take [1,2,3,4,5,6], 4
  #   [1,2,3,4]
  def take(collection, n) do
    { left, _ } = split(collection, n)
    left
  end

  # MyList.span(1, 3)
  #   [1,2,3]
  def span(from, to) when from == to do
    [to]
  end

  def span(from, to) when from > to do
    [from]
  end

  def span(from, to) do
    [from] ++ span(from + 1, to)
  end

  def primes_up_to(n) do
    lc x inlist span(2,n), length(divisors(x))==0, do: x
  end

  defp divisors x do
    lc y inlist span(2,round(:math.sqrt(x))), y != x, rem(x,y)==0, do: y
  end
end
