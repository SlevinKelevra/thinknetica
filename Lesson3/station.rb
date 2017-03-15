class Station
  attr_accessor :train_in_station

  def initialize(name_station)
    @station = name_station
    @train_in_station = []
  end

  def taking_train(type)
    self.train_in_station << type
    puts self.train_in_station
  end

  def type_train_list(type)
    self.train_in_station.select{|train| train == type}
  end

  def leave_train(val)
    self.train_in_station.delete_at(val)
  end
end
