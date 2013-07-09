defmodule Example do
  def func(p1, p2 // 2, p3 // 3, p4) do
    IO.puts inspect [p1,p2,p3,p4]
  end
end
