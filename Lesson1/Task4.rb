puts "Введите коэффициент а:"
a = gets.to_f

puts "Введите коэффициент b:"
b = gets.to_f

puts "Введите коэффициент c:"
c = gets.to_f

d = b**2 - 4*a*c

if d < 0
  puts "Корней нет"
elsif d == 0
puts "Дискриминат равен #{d}, имеется два равных кореня х1=х2 = #{(-b + Math.sqrt(d))/(2*a)}"
else
  puts "Дискриминат равен #{d}, имеется два кореня х1 = #{(-b + Math.sqrt(d))/(2*a)}, х2 = #{(-b - Math.sqrt(d))/(2*a)}"
end
