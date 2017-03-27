require_relative 'modules'

class PassengerWagon
  include Manufacturer
  attr_reader :free_place

  def initialize(place)
    @place = place.to_i
    @free_place = @place
  end

  def busy_place
    @seats - @free_seats
  end

  def take_place
    @free_seats = @free_seats - 1 unless @free_place.zero?
  end

end
