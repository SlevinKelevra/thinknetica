puts "Введите длину стороны a:"
a = gets.to_f

puts "Введите длину стороны b:"
b = gets.to_f

puts "Введите длину стороны c:"
c = gets.to_f

if a == b && b == c
  puts "Треугольник являеться равнобедренным и равносторонним"
abort
end

if a == b || b == c || c == a
  puts "Треугольник являеться равнобедренным"
else
  puts "Треугольник не равнобедренный"
end

  if a > b && a > c
    gip = a
    kat1 = b
    kat2 = c
  elsif b > c && b > a
    gip = b
    kat1 = a
    kat2 = c
  elsif c > a && c > b
    gip = c
    kat1 = b
    kat2 = a
  end

  if gip**2 == kat1**2 + kat2**2
    puts "Треугольник являтся прямоугольным"
  else
    puts "Треугольник не прямоугольный"
  end
