class Train
  attr_accessor :current_speed, :wagons, :numer

  def initialize(numer)
     @numer = numer
     @type = self.class
     @wagons = []
     @current_speed = 0
  end

  def dial_speed(dial)
    self.current_speed += dial
  end

  def brake_speed
    self.current_speed = 0
  end

  def hitch_vag(wagon)
    @wagons << wagon if @current_speed.zero? && type_wagon?(wagon)
  end

  def detach_vag(wagon)
      @wagons.delete(wagon) if @current_speed.zero? && @wagons.length > 0
  end

  # def route=(route)
  def route_station(route)
    @route = route
    @index_station = 0
  end

  def forward
    # binding.pry
    if @index_station < @route.stations.size - 1
       @index_station += 1
       @route.stations[@index_station].taking_train(self)
       @route.stations[@index_station - 1].leave_train(self)
    else
       puts "Вы находитесь на последний станции, дальше двигаться нельзя"
    end
  end

  def back_station
    if @index_station > 0
       @index_station -= 1
       @route.stations[@index_station].taking_train(self)
       @route.stations[@index_station + 1].leave_train(self)
    else
  puts "Вы находитесь на первой станции"
    end
  end

  def current_station
    if @route
       @route.stations[@index_station]
    else
       puts "Ошибка ввода данных"
    end
  end

  def previous_station
    if @index_station > 0
       @route.station[@index_station -1]
    else
       puts "Отсутствует предыдущая, начало пути "
    end
  end

  def next_station
    if @index_station <  @route.station.size - 1
       @route.station[@index_station +1]
    else
       puts "Отсутствует слудующая станция, конец пути пути "
    end
  end

private

  def type_wagon?(wagon)
    type_passenger?(wagon) || type_cargo?(wagon)
  end

  def type_passenger?(wagon)
    wagon.is_a?(PassengerWagon) && self.is_a?(PassengerTrain)
  end

  def type_cargo?(wagon)
    wagon.is_a?(CargoWagon) && self.is_a?(CargoTrain)
  end

end
