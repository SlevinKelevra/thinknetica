require_relative 'core'
require 'pry'

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

def make_station
  begin
    puts '***** Создание станции *****'
    enter_name_station
    @app.create_station(@station)
    puts "***** Станция: #{@station} создана *****"
  rescue RuntimeError => e
    сaught_error(e)
  end
end

def make_train
  begin
    puts '***** Создание поезда *****'
    puts 'Введите 1 для создания пассажирского поезда и 2 для грузового'
    input = gets.chomp.to_i
    if input == 1
      enter_number_train
      @app.create_passenger_train(@number_train)
      puts "***** Пассажирский поезд #{@number_train} создан *****"
    elsif input == 2
      enter_number_train
      @app.create_passenger_train(@number_train)
      puts "***** Грузовой поезд #{@number_train} создан *****"
    end
  rescue RuntimeError => e
    сaught_error(e)
  end
end

def make_route
  begin
    puts '***** Создание маршрута *****'
    enter_stations_route
    @app.create_route(@first_station, @last_station)
    puts "---------- Маршрут #{@first_station} #{@last_station} создан ----------"
  rescue RuntimeError => e
    сaught_error(e)
  end
end

def route_for_train
  begin
    enter_number_train
    enter_stations_route
    @app.route_guidance(@number_train, @first_station, @last_station)
  rescue RuntimeError => e
    сaught_error(e)
  end
end

def go
  begin
    puts '***** Движение поезда вперед *****'
    enter_number_train
    @app.forward(@number_train)
  rescue RuntimeError => e
    сaught_error(e)
  end
end

def back
  begin
    puts '***** Движение поезда назад *****'
    enter_number_train
    @app.back_station(@number_train)
  rescue RuntimeError => e
    сaught_error(e)
  end
end

def make_wagon
  puts '***** Создание вагонов *****'
  puts 'Введите 1 чтобы создать пассажирский вагон и 2 чтобы грузовой'
  input = gets.chomp.to_i
  if input == 1
    puts "Введите количество мест в вагоне"
    place = gets.chomp.to_i
    @app.create_passenger_wagon(place)
    puts '***** Пассажирский вагон создан *****'
  elsif input == 2
    puts "Введите объем вагона"
    volume = gets.chomp.to_f
    @app.create_cargo_wagon(volume)
    puts '***** Грузовой вагон создан *****'
  end
end

def add_wag
  begin
    puts '***** Добавление вагонов *****'
    enter_number_train
    @app.add_wagon(@number_train)
  rescue RuntimeError => e
    сaught_error(e)
  end
end

def remove_wag
  begin
    puts '***** Отцепление вагонов ******'
    enter_number_train
    @app.detach_wagon(@number_train)
  rescue RuntimeError => e
    сaught_error(e)
  end
end

def list_train_on_station
  begin
    enter_name_station
    @app.trains_on_station(@station)
  rescue RuntimeError => e
    сaught_error(e)
  end
end

def place_in_wagon
  enter_number_train
  @app.volume_wagon(@number_train)
end

@app = Core.new
attr_reader :app
