puts "Как Вас зовут?"
name = gets.chomp

puts "Какой у Вас рост?"
height = gets.to_i

if height <= 0
  puts "Введено некорректное значение роста"
abort
end

height = height-110

if height < 0
  puts "Ваш вес уже оптимальный"
else
  puts "Привет, #{name}. Твой идеальный все состовляет #{height} кг."
end
