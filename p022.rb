
fh = File.open('names.txt', 'r')
names = fh.readline.split(',')
names.map! do |name|
  name[1..name.length-2]
end
names.sort!

sum = 0
names.each_with_index do |name, index|
  score = 0
  name.each_byte do |b|
    score += b - 64
  end
  sum += score * (index + 1)
end

puts sum

