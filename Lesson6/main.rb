require_relative 'core'

app = Core.new

def сaught_error(e)
  puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
  puts "Попробуйте еще раз"
end

def enter_number_train
  puts 'Введите номер поезда'
  @number_train = gets.chomp
end

def enter_name_station
  puts 'Введите название станции'
  @station = gets.chomp
end

def enter_stations_route
  puts 'Введите станцию отправления'
  @first_station = gets.chomp
  puts 'Введите конечную станцию'
  @last_station = gets.chomp
end

loop do
  puts "Введите номер:\n1 - для создания станции"
  puts "2 - для создания поезда\n3 - для создания маршрута"
  puts "4 - для добавления маршрута к поезду\n5 - для движения поезда вперед"
  puts "6 - для движения поезда назад\n7 - создание вагонов"
  puts "8 - добавить вагоны у поезда\n9 - убрать вагоны у поезда"
  puts "10 - посмотреть все станции"
  puts "11 - посмотреть поезда на станции"
  puts "12 - Выход"
  input = gets.chomp.to_i
  break if input == 12
  case input

  when 1
    begin
      puts '***** Создание станции *****'
      enter_name_station
      app.create_station(@station)
      puts "***** Станция: #{@station} создана *****"
    rescue RuntimeError => e
      сaught_error(e)
    end

  when 2
    begin
      puts '***** Создание поезда *****'
      puts 'Введите 1 для создания пассажирского поезда и 2 для грузового'
      input = gets.chomp.to_i
      if input == 1
        enter_number_train
        app.create_passenger_train(@number_train)
        puts "***** Пассажирский поезд #{@train_number} создан *****"
      elsif input == 2
        enter_number_train
        app.create_passenger_train(@number_train)
        puts "***** Грузовой поезд #{@train_number} создан *****"
      end
    rescue RuntimeError => e
      сaught_error(e)
    end

  when 3
    begin
      puts '***** Создание маршрута *****'
      enter_stations_route
      app.create_route(@first_station, @last_station)
      puts "---------- Маршрут #{@first_station} #{@last_station} создан ----------"
    rescue RuntimeError => e
      сaught_error(e)
    end

  when 4
    begin
      enter_number_train
      enter_stations_route
      app.route_guidance(@number_train, @first_station, @last_station)
    rescue RuntimeError => e
      сaught_error(e)
    end

  when 5
    begin
      puts '***** Движение поезда вперед *****'
      enter_number_train
      app.forward(@number_train)
    rescue RuntimeError => e
      сaught_error(e)
    end

  when 6
    begin
      puts '***** Движение поезда вперед *****'
      enter_number_train
      app.back_station(@number_train)
    rescue RuntimeError => e
      сaught_error(e)
    end

  when 7
    puts '***** Создание вагонов *****'
    puts 'Введите 1 чтобы создать пассажирский вагон и 2 чтобы грузовой'
    input = gets.chomp.to_i
    if input == 1
      app.create_passenger_wagon
      puts '***** Пассажирский вагон создан *****'
    elsif input == 2
      app.create_cargo_wagon
      puts '***** Грузовой вагон создан *****'
    end

  when 8
    begin
      puts '***** Добавление вагонов *****'
      enter_number_train
      app.add_wagon(@number_train)
    rescue RuntimeError => e
      сaught_error(e)
    end

  when 9
    begin
      puts '***** Отцепление вагонов ******'
      enter_number_train
      app.detach_wagon(@number_train)
    rescue RuntimeError => e
      сaught_error(e)
    end

  when 10
    app.stations_list

  when 11
    begin
      enter_name_station
      app.trains_on_station(@station)
    rescue RuntimeError => e
      сaught_error(e)

  end
end
end
