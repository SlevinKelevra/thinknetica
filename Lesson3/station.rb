class Station
  attr_reader :trains

  def initialize(name_station)
    @station = name_station
    @trains = []
  end

  def taking_train(type)
    self.trains << type
    puts self.trains
  end

  def type_train_list(type)
    self.trains.select{|train| train == type}
  end

  def leave_train(val)
    self.trains.delete_at(val)
  end
end
