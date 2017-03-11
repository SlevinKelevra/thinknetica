counter = 0
hash = {}
vowel = ['a', 'e','i', 'o', 'y']

('a'..'z').each do |i|
  counter +=1
    hash [counter] = i if vowel.include?(i) == true
end

puts hash
