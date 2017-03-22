class Station
  attr_accessor :trains, :name

  def initialize(name_station)
    @name = name_station
    @trains = []
  end

  def taking_train(train)
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
