
=begin
This program only needs to get 1% of the way through the primes before it finds
the correct answer.
=end

CEILING = 1000000
CEILING_SQRT = Math.sqrt(CEILING)
INFINITY = 1.0 / 0.0

#Sieve of Eratosthenes
puts 'Determining primes...'
primes = (2..CEILING).to_a #one million
for p in primes
  next if p.nil?
  break if p > CEILING_SQRT #Only need to go up to sqrt(n)
  ((p*2)..CEILING).step(p).each do |n|
    primes[n-2] = nil
  end
end

#Trim all the nils
puts 'Trimming primes...'
primes = primes.reject {|n| n.nil? }

puts 'Searching for max length...'
found = false
max_length = 0
num_primes = primes.length
counter = 0
for i in (1..primes.length)
  target = primes[-i]
  primes.each_with_index do |item, index|
    break if item * max_length > target
    next if item >= target
    sum = item
    length = 1
    for j in ((index+1)..(primes.length-1))
      sum += primes[j]
      break if sum >= target
      length += 1
    end
    if sum == target && length > max_length
      found = target
      max_length = length
    end
  end

  counter += 1
  if counter % 100 == 0
    percent = counter.to_f / num_primes
    puts "#{percent}%"
    puts "Best guess: #{found}"
  end
end

puts 'Done: ', found

