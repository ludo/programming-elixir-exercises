defmodule Spawn2 do
  def greet do
    receive do
      { sender, msg } -> sender <- { :ok, "Hello #{msg}" }
    end
  end
end

pid = spawn(Spawn2, :greet, [])

pid <- { self, "World!" }
receive do
  { :ok, message } -> IO.puts message
end

pid <- { self, "Kermit!" }
receive do
  { :ok, message } -> IO.puts message
end
