fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> "#{c}"
end

main = fn n -> fizz_buzz.(rem(n,3), rem(n,5), n) end

IO.puts main.(10)
IO.puts main.(11)
IO.puts main.(12)
IO.puts main.(13)
IO.puts main.(14)
IO.puts main.(15)
IO.puts main.(16)
