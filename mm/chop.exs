defmodule Chop do
  # Chop.guess(1, 1..2)
  # Chop.guess(273, 1..1000)
  # Chop.guess(723, 1..1000)
  # Chop.guess(10, 5..15)
  def guess(actual, lower..upper) when actual < upper do
    halfway = div(lower + upper, 2)
    IO.puts "Is it #{halfway}"
    guess(actual, lower..halfway)
  end
  def guess(actual, _..upper) when actual > upper do
    guess(actual, upper..(upper + div(upper, 2)))
  end
  def guess(actual, _), do: IO.puts "#{actual}"
end
