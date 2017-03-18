require_relative 'core'

app = Core.new

loop do
  puts "Введите номер:\n1 - для создания станции"
  puts "2 - для создания поезда\n3 - для создания маршрута"
  puts "4 - для добавления маршрута к поезду\n5 - для движения поезда вперед"
  puts "6 - для движения поезда назад\n7 - добавить вагонов к поезду"
  puts "8 - убрать вагоны у поезда\n9 - посмотреть все станции"
  puts "11 - Выход"
  input = gets.chomp.to_i
  break if input == 11
  case input
  when 1
    puts 'making station'
    app.creat_station
  when 2
    app.create_train
  when 3
    app.create_route
  when 4
    app.route_guidance
  when 5
    app.forward
  when 6
    app.back_station
  when 7
    app.add_wagon
  when 8
    app.detach_wagon
  when 9
    app.stations_list
  end
end
