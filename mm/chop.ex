defmodule Chop do
  # Chop.guess(5, 1..10)
  # Chop.guess(3, 1..12)
  # Chop.guess(9, 1..12)

  def guess(actual, range) do
    current = div(range.first + range.last, 2)
    IO.puts "Is it #{current}?"
    guess actual, range, current
  end

  def guess(actual, _, current) when actual == current do
    IO.puts "It is #{current}"
  end

  def guess(actual, range, current) when actual < current do
    guess actual, range.first..current
  end

  def guess(actual, range, current) when actual > current do
    guess actual, current..range.last
  end
end
