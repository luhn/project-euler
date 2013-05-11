require 'generator'

#A generator for the Fibonacci sequence
fib = Generator.new do |fib|
  older = 1
  old = 2
  fib.yield 1
  fib.yield 2
  
  while true
    new = old + older
    older = old
    old = new
    fib.yield new
  end
end

max = 4000000 #Four million
sum = 0
while (n = fib.next) <= max
  if n % 2 == 0
    sum += n
  end
end

puts sum

