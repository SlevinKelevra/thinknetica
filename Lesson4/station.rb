class Station
  attr_accessor :trains, :station

  def initialize(name_station)
    @station = name_station
    @trains = []
  end

  def taking_train(train)
    # binding.pry
    self.trains << train
    puts self.trains
  end

  def type_train_list(type)
    trains.select{|train| self.numer == type}
  end

  def leave_train(train)
    self.trains.delete(train)
  end
end
