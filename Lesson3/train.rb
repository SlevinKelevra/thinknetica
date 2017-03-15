class Train
  attr_accessor :current_speed, :count_vag

  def initialize(numer, type, count_vag)
     @numer = numer
     @type = type
     @count_vag = count_vag
     @current_speed = 0
  end

  def dial_speed(dial)
    self.current_speed += dial
  end

  def brake_speed
    self.current_speed = 0
  end

  def hitch_vag
    if self.current_speed != 0
      puts "Нельзя приклеплять вагоны когда поезд движеться."
    else
       self.count_vag += 1
    end
  end

  def detach_vag
    if self.current_speed != 0 || self.count_vag <= 0
      puts "Нельзя отцеплять вагоны когда поезд движеться или у Вас уже отсутствуют все вагоны."
    else
       self.count_vag -= 1
    end
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

end
