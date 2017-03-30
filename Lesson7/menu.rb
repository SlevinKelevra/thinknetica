require_relative 'main'

loop do
  puts "Введите номер:\n1 - для создания станции"
  puts "2 - для создания поезда\n3 - для создания маршрута"
  puts "4 - для добавления маршрута к поезду\n5 - для движения поезда впред"
  puts "6 - для движения поезда назад\n7 - создание вагонов"
  puts "8 - добавить вагоны у поезда\n9 - убрать вагоны у поезда"
  puts "10 - посмотреть все станции"
  puts "11 - посмотреть поезда на станции\n12 - добавить пассажиров или груз в вагоны"
  puts "13 - посмотреть информацию о поезде"
  puts "14 - перебор всех поездов на станции"
  puts "15 - Выход"

  input = gets.chomp.to_i
  break if input == 15
  case input

  when 1
    make_station

  when 2
    make_train

  when 3
    make_route

  when 4
    route_for_train

  when 5
    go

  when 6
    back

  when 7
    make_wagon

  when 8
    add_wag

  when 9
    remove_wag

  when 10
    @app.stations_list

  when 11
    list_train_on_station

  when 12
    place_in_wagon

  when 13
    enter_number_train
    @app.see_train(@number_train)

  when 14
    every_train

end
end
