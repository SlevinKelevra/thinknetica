require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'

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
    puts "Станция создана"
  end

  def create_route
    puts "Введите станцию отправления"
    first_station = gets.chomp
    puts "Введите конечную станцию"
    last_station = gets.chomp
    @route_collection << Route.new(first_station, last_station)
    puts "Маршрут создан"
  end

  def create_train
    puts "Если вы хотите создать пассажирский поезд нажмите "1", а еслм грузовой нажмите "2""
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

  def route_guidance


  end
end
