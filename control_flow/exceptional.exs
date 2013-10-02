# Exercise: ControlFlow-3
defmodule Exceptional do
  def ok!({ :ok, data}), do: data
  def ok!({ _, error }), do: raise "Oops! #{IO.inspect error}"
  def ok!(param), do: raise "Expected tuple, got #{IO.inspect param}"
end
