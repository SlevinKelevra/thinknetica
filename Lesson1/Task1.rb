puts "Как Вас зовут?"
name = gets.chomp

puts "Какой у Вас рост?"
height = gets.to_i

if height < 0
  puts "Введено некорректное значение роста"
elsif (height-110) < 0
puts "Ваш вес уже оптимальный"
else
  puts "Привет, #{name}. Твой идеальный все состовляет #{height-110} кг."
end
