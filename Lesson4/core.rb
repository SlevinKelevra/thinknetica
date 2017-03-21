require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require 'pry'

class Core
  def initialize
    @station_collection = []
    @route_collection = []
    @trains_collection = []
  end

  def creat_station
    puts "Введите название станции"
    input = gets.chomp
    @station_collection << Station.new(input)
    puts "Станция #{input} создана"
  end

  def create_route
    puts "Введите станцию отправления"
    first_station = gets.chomp
    puts "Введите конечную станцию"
    last_station = gets.chomp
    @route_collection << Route.new(get_station(first_station), get_station(last_station))
    p @route_collection
    puts "Маршрут создан"
  end

  def create_train
    puts "Если вы хотите создать пассажирский поезд нажмите '1', а еслм грузовой нажмите'2'"
    input = gets.chomp.to_i
    if input == 1
      puts "Введите номер поезда"
      numer = gets.chomp.to_i
      @trains_collection << PassengerTrain.new(numer)
    elsif input == 2
      puts "Введите номер поезда"
      numer = gets.chomp.to_i
      @trains_collection << CargoTrain.new(numer)
    else
      puts "Введено неверно значение"
    end
  end

  def route_guidance
    puts "Введите номер поезда"
    number_train = gets.chomp.to_i
    puts "Введите станцию отправления"
    first_station = gets.chomp
    puts "Введите конечную станцию"
    last_station = gets.chomp
    if route_any?(first_station, last_station)
      get_train(number_train).route_station(get_route(first_station, last_station))
    p  @trains_collection
    else
      puts 'Машрута не существует'
    end
  end

  def forward
    puts 'Введите номер поезда'
    number_train = gets.chomp.to_i
    if train_any?(number_train)
      get_train(number_train).forward
    else
      puts 'Поезд несоздан'
    end
  end

  def back_station
    puts 'Введите номер поезда'
    number_train = gets.chomp.to_i
    if train_any?(number_train)
      get_train(number_train).back_station
    else
      puts 'Поезд несоздан'
    end
  end

  def add_wagon
    puts 'Введите номер поезда'
    number_train = gets.chomp.to_i
    if train_any?(number_train)
      create_wagon
      get_train(number_train).hitch_vag(@count_vag)
    else
      puts 'Введено неверно значение'
    end
  end

  def detach_wagon
    puts 'Введите номер поезда'
    number_train = gets.chomp
    if train_any?(number_train)
      create_wagon
      get_train(number_train).detach_vag(@count_vag)
    else
      puts 'Введено неверно значение'
    end
  end

  def stations_list
    @station_collection.each { |station| puts station.station }
  end

  def trains_on_station
    puts 'Введите имя станции'
    station = gets.chomp
    binding.pry
    get_station(station).trains.each { |train| puts "Номер поезда #{train.numer} #{train.type} с #{train.count_vag.length} вагонов"}
  end

  private

  def get_route(first_station, last_station)
    @route_collection.find{ |route| route.stations.first.station == first_station && route.stations.last.station == last_station }
  end

  def get_train(number_train)
    @trains_collection.find{ |train| train.numer == number_train}
  end

  def get_station(station)
    @station_collection.find{ |i| i.station == station}
  end

  def station_any?(station)
    get_station(station)
  end

  def train_any?(train)
    get_train(train)
  end

  def route_any?(first_station, last_station)
    get_route(first_station, last_station)
  end

  def create_wagon
    puts 'Введите "1", если хотите добавть пассажирский вагон и "2" если грузовой'
    input = gets.chomp.to_i
    if input == 1
      @count_vag = PassengerWagon.new
    elsif input == 2
      @count_vag = CargoWagon.new
    else
      puts 'Введено неверно значение'
    end
  end

end
