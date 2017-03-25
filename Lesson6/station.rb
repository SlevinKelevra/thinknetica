class Station
  @@list_station = []

  def self.all
    @@list_station
  end

  attr_accessor :trains, :name
  NAME_FORMAT = /^.*[а-я]$/i

  def initialize(name_station)
    @name = name_station
    validate!
    @trains = []
    @@list_station << self
  end

  def station_valid?
    validate!
  rescue
    false
  end

  def taking_train(train)
    self.trains << train
  end

  def type_train_list(type)
    trains.select{|train| self.numer == type}
  end

  def leave_train(train)
    self.trains.delete(train)
  end

  protected

  attr_writer :current_rpm

  def validate!
    raise "Название станции не может быть меньше 5 символов" if name.length < 5
    raise "Название станции не соответсвует формату" if name !~ NAME_FORMAT
  end

end
