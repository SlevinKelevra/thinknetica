class Station
  attr_reader :trains

  def initialize(name_station)
    @station = name_station
    @trains = []
  end

  def taking_train(train)
    self.trains << train
    puts self.trains
  end

  def type_train_list(type)
    trains.select{|train| train == type}
  end

  def leave_train(train)
    self.trains.delete(train)
  end
end
