counter = 0
hash = {}

('a'..'z').each do |i|
counter +=1

 ['a', 'e','i', 'o', 'y'].each do |l|
if l == i
    hash [counter] = i
    end

  end
end
puts hash
