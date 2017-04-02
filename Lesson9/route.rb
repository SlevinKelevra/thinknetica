class Route
  attr_accessor :stations

  def initialize(first_st, last_st)
    @stations = [first_st, last_st]
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    if station == @stations.first || station == @stations.last
      puts 'You cannot delete a station of departure/arrival'
    else
      @stations.delete(station)
    end
  end

  protected

  def validate!
    raise 'A route cannot contain less than two stations' unless @stations.all? { |station| station.is_a?(Station) }
  end
end
