fibonacci = [0, 1]

while (arr = fibonacci[-2] + fibonacci[-1]) < 100 do
  arr = fibonacci[-2] + fibonacci[-1]
  fibonacci << arr
end
puts fibonacci
