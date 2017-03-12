counter = 0
hash = {}
vowels = %w(a e i o y)

('a'..'z').each do |i|
  counter +=1
  hash [counter] = i if vowels.include?(i)
end

puts hash
