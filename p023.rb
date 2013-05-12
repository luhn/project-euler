

class Integer
  #Monkey patching the builtin Integer class!  Woohoo!
  #Not exactly necessary, but I wanted to have some fun.
  def proper_divisor_sum
    sum = 1 #Already know 1 is a divisor
    for i in 2..(self/2)
      if self % i == 0
        sum += i
      end
    end
    sum
  end

  def abundant?
    proper_divisor_sum > self
  end
end

abundant = (1..28123).find_all{|n| n.abundant?}

puts abundant[0..12]

sum = 0
for n in 1..28123
  for a in abundant:
    if a < n
      continue
    end
  end
end


