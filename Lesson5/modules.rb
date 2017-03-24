module Manufacturer

  def name_manufacturer
    puts "Введите название компании:"
    self.manufacturer = gets.chomp
  end

  def get_manufacturer
    self.manufacturer
  end

  protected
  attr_accessor :manufacturer
end
