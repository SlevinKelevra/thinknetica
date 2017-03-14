class Train
attr_accessor :current_speed, :count_vag, :type_train

  def initialize (numer, type_train, count_vag)
     @numer = numer
     @type_train = type_train
     @count_vag = count_vag
     @current_speed = 0
  end

  def dial_speed (dial)
    self.current_speed += dial
  end

  def brake_speed
    self.current_speed = 0
  end

  def detach_vag (val)
    if self.current_speed != 0
      puts "Нельзя откреплять/приклеплять вагоны когда поезд движеться."
    elsif val == 'Прикрепить'
      self.count_vag += 1
    elsif val == 'Открепить'
      self.count_vag -= 1
    else puts "Ошибка ввода данных"
    end
  end

  def route_station (route)
    @route = route
    @index_station = 0
  end

  def up_station
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
       @route.station[@index_station].takin_train(self)
       @route.station[@index_station + 1].leave_train(self)
    else
  puts "Вы находитесь на первой станции"
    end
  end

  def current_st
    if @route
      @route.station[@index_station]
    else
      puts "Ошибка ввода данных"
    end
  end

  def current_st
    if @index_station - 1 >= 0
      @route.station[@index_station -1]
    else
      puts "Отсутствует предыдущая, начало пути "
    end
  end

  def next_st
    if @index_station <  @route.station.size - 1
      @route.station[@index_station +1]
    else
      puts "Отсутствует слудующая станция, конец пути пути "
    end
  end

end
