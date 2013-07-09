fizzbuzz = function do
  0,0,_ -> "FizzBuzz"
  0,_,_ -> "Fizz"
  _,0,_ -> "Buzz"
  _,_,c -> c
end

fizz_buzz = fn n -> fizzbuzz.(rem(n,3), rem(n,5), n) end

IO.puts fizzbuzz.(1,2,3)
IO.puts fizzbuzz.(0,0,1)
IO.puts fizzbuzz.(0,1,2)
IO.puts fizzbuzz.(1,0,1)

IO.puts fizz_buzz.(10)
IO.puts fizz_buzz.(11)
IO.puts fizz_buzz.(12)
IO.puts fizz_buzz.(13)
IO.puts fizz_buzz.(14)
IO.puts fizz_buzz.(15)
IO.puts fizz_buzz.(16)
