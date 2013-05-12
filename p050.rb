CEILING = 1000000
INFINITY = 1.0 / 0.0

#Sieve of Eratosthenes
primes = (2..CEILING).to_a #one million
for p in primes
  if p.nil?
    next
  end
  ((p*2)..CEILING).step(p).each do |n|
    primes[n-2] = nil
  end
end

#Trim all the nils
primes = primes.reject {|n| n.nil? }

found = false
max_length = 0
for i in (1..primes.length)
  target = primes[-i]
  primes.each_with_index do |item, index|
    if item >= target
      next
    end
    sum = item
    length = 1
    for j in ((index+1)..(primes.length-1))
      sum += primes[j]
      if sum >= target
        break
      end
      length += 1
    end
    if sum == target && length > max_length
      found = target
      max_length = length
    end
  end
end

puts found

