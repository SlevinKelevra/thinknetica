class Route
  attr_reader :stations

  def initialize(first_st, last_st)
    @stations = [first_st, last_st]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    if station == @stations.first || station == @stations.last
      puts "Нельзя удалять станцию отправления/прибытия"
    else
      @stations.delete(station)
    end
  end

end
