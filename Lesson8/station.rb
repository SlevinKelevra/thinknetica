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

  def each_train
    trains.each { |train| yield(train) }
  end

  def taking_train(train)
    trains << train
  end

  def type_train_list(type)
    trains.select { |_train| numer == type }
  end

  def leave_train(train)
    trains.delete(train)
  end

  protected

  attr_writer :current_rpm

  def validate!
    raise 'Station name can not be less than 5 characters' if name.length < 5
    raise 'Station name does not match the format' if name !~ NAME_FORMAT
  end
end
