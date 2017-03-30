require_relative 'modules'

class CargoWagon
  include Manufacturer
  attr_reader :free_volume

  def initialize(volume)
    @volume = volume
    @free_volume = @volume
  end

  def take_volume(volume)
    @free_volume -= volume unless (@free_volume - volume) < 0
  end

  def volume_occupeid
    @volume - @free_volume
  end

end
