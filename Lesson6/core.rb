require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

class Core
  def initialize
    @station_collection = []
    @route_collection = []
    @trains_collection = []
  end

  def create_station(name_station)
    @station_collection << Station.new(name_station)
  end

  def create_route(first_station, last_station)
    @route_collection << Route.new(get_station(first_station), get_station(last_station))
  end

  def create_passenger_train(number)
    @trains_collection << PassengerTrain.new(number)
  end

  def create_cargo_train(number)
     @trains_collection << CargoTrain.new(number)
  end

  def route_guidance(number_train, first_station, last_station)
    train = get_train(number_train)
    route = get_route(first_station, last_station)
    train.route_station(route) if train && route
  end

  def forward(number_train)
    train = get_train(number_train)
    train.forward if train
  end

  def back_station(number_train)
    train = get_train(number_train)
    train.back_station if train
  end

  def create_passenger_wagon
      @wagon = PassengerWagon.new
  end

  def create_cargo_wagon
      @wagon = CargoWagon.new
  end

  def add_wagon(number_train)
    train = get_train(number_train)
    train.hitch_vag(@wagon) if train
  end

  def detach_wagon(number_train)
    train = get_train(number_train)
    @wagon = get_train(number_train).wagon.last
    train.detach_vag(@wagon) if train
  end

  def stations_list
    @station_collection.each { |station| puts station.name }
  end

  def trains_on_station(station)
    get_station(station).trains.each { |train| puts "Номер поезда #{train.numer} #{train.type} с #{train.wagon.length} вагонов"}
  end

  private

  def get_route(first_station, last_station)
    @route_collection.find{ |route| route.stations.first.name == first_station && route.stations.last.name == last_station }
  end

  def get_train(number_train)
    @trains_collection.find{ |train| train.numer == number_train}
  end

  def get_station(station)
    @station_collection.find{ |i| i.name == station}
  end

end
