class CargoTrain < Train

  def type_wagon?(wagon)
    wagon.is_a?(CargoWagon) && self.is_a?(CargoTrain)
  end

end
