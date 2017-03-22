class PassengerTrain < Train

  def type_wagon?(wagon)
    wagon.is_a?(PassengerWagon) && self.is_a?(PassengerTrain)
  end

end
