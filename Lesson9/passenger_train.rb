class PassengerTrain < Train
  private

  def type_wagon?(wagon)
    wagon.is_a?(PassengerWagon)
  end
end
