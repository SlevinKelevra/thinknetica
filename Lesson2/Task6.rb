summa = 0
shopping_cart = {}
loop do
  puts "Введите название продукта если хотите продолжить, если хотите закончить введите 'Stop'"
  name = gets.chomp
  break if name == "Stop"

  puts  "Введите стоимость"
  price = gets.to_f
  if price <= 0
    puts "Введено некорректное значение"
    puts  "Повторно введите стоимость"
    price = gets.to_f
  end

  puts "Введите количество товара"
  count = gets.to_f
  if count <= 0
    puts "Введено некорректное значение"
    puts  "Повторно введите количество товара"
    count = gets.to_f
  end

  shopping_cart[name] = {"Цена" => price, "Количество" => count, "Сумма" => price * count}

  summa += shopping_cart[name]["Сумма"]

end

puts shopping_cart
puts summa
