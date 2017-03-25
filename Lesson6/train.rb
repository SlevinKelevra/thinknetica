require_relative 'modules'
require_relative 'instance_counter'

class Train

  include Manufacturer
  include InstanceCounter
  attr_accessor :current_speed, :wagon, :numer
  NUMBER_FORMAT = /^[a-z0-9]{3}-*[a-z0-9]{2}/

  @@trains = {}
  def self.find(numer)
    @@trains[numer]
  end

  def initialize(numer)
     @numer = numer
     validate!
     @type = self.class
     @wagon = []
     @current_speed = 0
     @@trains[numer] = self
     register_instance
  end

  def number_train_valid?
    validate!
  rescue
    false
  end

  def dial_speed(dial)
    self.current_speed += dial
  end

  def brake_speed
    self.current_speed = 0
  end

  def hitch_vag(wagon)
    @wagon << wagon if @current_speed.zero? && type_wagon?(wagon)
  end

  def detach_vag(wagon)
    @wagon.delete(wagon) if @current_speed.zero? && @wagon.length > 0
  end

  def route_station(route)
    @route = route
    @index_station = 0
  end

  def forward
    @index_station += 1 if @index_station < @route.stations.size - 1
    current_station.taking_train(self)
    previous_station.leave_train(self)
  end

  def back_station
    @index_station -= 1 if @index_station > 0
    current_station.taking_train(self)
    next_station.leave_train(self)
  end

  def current_station
    @route.stations[@index_station] if @route
  end

  def previous_station
     @route.stations[@index_station -1] if @index_station > 0
  end

  def next_station
     @route.stations[@index_station +1] if @index_station <  @route.stations.size - 1
  end

private

  def validate!
    raise 'Номер не соответствует формату' if numer !~ NUMBER_FORMAT
  end

  def type_wagon?(wagon)
    
  end

end
