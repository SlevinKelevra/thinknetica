hash = {jan: 31, feb: 28, mar: 31, apr: 30, may: 31, jun: 30, jul: 31, aug: 31,
sept: 30, oct: 31, nov: 30, dev: 31 }

hash.each  do |key, val|
if val == 30
  puts "#{key}"
end
end
