class CargoTrain < Train

  private

  def type_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end

end
