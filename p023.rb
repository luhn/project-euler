require 'set'

abundant = Set.new((12..28123).find_all do |n|
  #Sum the proper divisors
  sum = 1 #Already know 1 is a divisor
  for i in 2..(n/2)
    if n % i == 0
      sum += i
    end
  end
  sum > n
end)

sum = 0
for n in 1..28123
  found = false
  for a in abundant
    if a > n
      next
    end
    if abundant.include?(n-a)
      found = true
      break
    end
  end
  if not found
    sum += n
  end
end

puts sum

