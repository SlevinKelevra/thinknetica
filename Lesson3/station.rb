class Station
  attr_accessor :type

  def initialize (name_station)
    @station = name_station
    @type = []
  end

  def taking_train (type)
    self.type << type
    puts self.type
  end

  def train_list
    puts "На станции сейчас #{self.type.size} поездов"
  end

  def type_train_list (type)
    self.type.select{|train| train == type}
  end

  def leave_train (val)
    self.type.delete_at(val)
  end
end
