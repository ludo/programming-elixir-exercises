defmodule Spawn1 do
  def greet do
    receive do
      { sender, msg } ->
        sender <- { :ok, "Hello #{msg}" }
    end
  end
end

# client
pid = spawn(Spawn1, :greet, [])
pid <- { self, "World!" }

receive do
  { :ok, message } ->
    IO.puts message
end
