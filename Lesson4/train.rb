class Train
  attr_accessor :current_speed, :count_vag

  def initialize(numer)
     @numer = numer
     @type = self.class
     @count_vag = []
     @current_speed = 0
  end

  def dial_speed(dial)
    self.current_speed += dial
  end

  def brake_speed
    self.current_speed = 0
  end

  def hitch_vag(wagon)
    @count_vag << wagon if @current_speed.zero? && type_wagon?(wagon)
  end

  def detach_vag(wagon)
      @count_vag.delete(wagon) if @current_speed.zero? && @count_vag.length > 0
  end

  def route_station(route)
    @route = route
    @index_station = 0
  end

  def forward
    if @index_station < @route.station.size - 1
       @index_station += 1
       @route.station[@index_station].taking_train(self)
       @route.station[@index_station - 1].leave_train(self)
    else
       puts "Вы находитесь на последний станции, дальше двигаться нельзя"
    end
  end

  def back_station
    if @index_station > 0
       @index_station -= 1
       @route.station[@index_station].taking_train(self)
       @route.station[@index_station + 1].leave_train(self)
    else
  puts "Вы находитесь на первой станции"
    end
  end

  def current_station
    if @route
       @route.station[@index_station]
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
    true if wagon.is_a?(PassengerWagon) && self.is_a?(PassengerTrain) || carriage.is_a?(CargoWagon) && self.is_a?(CargoTrain)
  end

end
