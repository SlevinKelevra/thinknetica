require 'pry'
class Train
  attr_accessor :current_speed, :wagon, :numer

  def initialize(numer)
     @numer = numer
     @type = self.class
     @wagon = []
     @current_speed = 0
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
    if @index_station < @route.stations.size - 1
       @index_station += 1
       current_station.taking_train(self)
       previous_station.leave_train(self)
    else
       puts "Вы находитесь на последний станции, дальше двигаться нельзя"
    end
  end

  def back_station
    if @index_station > 0
       @index_station -= 1
       current_station.taking_train(self)
       next_station.leave_train(self)
    else
  puts "Вы находитесь на первой станции"
    end
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

  def type_wagon?(wagon)
  end

end
