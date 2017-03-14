class Route
  attr_accessor :station

  def initialize (first_st, last_st)
    @station = [first_st, last_st]
  end

  def add_st (name_st)
    @station.insert((-2), name_st)
    puts @station
  end

  def del_st (name_st)
    if name_st == @station.first || name_st == @station.last
      puts "Нельзя удалять станцию отправления/прибытия"
    else @station.delete(name_st)
    end
  end

end
