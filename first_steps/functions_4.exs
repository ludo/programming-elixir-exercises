prefix = fn prefix -> fn str -> "#{prefix} #{str}" end end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")

IO.puts prefix.("Elixir").("Rocks")
