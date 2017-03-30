require_relative 'core'

@app = Core.new

def caught_error(e)
  puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
  puts 'Try again'
end

def enter_number_train
  puts 'Enter number train'
  @number_train = gets.chomp
end

def enter_name_station
  puts 'Enter name station'
  @station = gets.chomp
end

def enter_stations_route
  puts 'Enter first stattion'
  @first_station = gets.chomp
  puts 'Enter last station'
  @last_station = gets.chomp
end

def make_station
  puts '***** Creation station *****'
  enter_name_station
  @app.create_station(@station)
  puts "***** Station: #{@station} created *****"
rescue RuntimeError => e
  caught_error(e)
end

def make_train
  puts '***** Creation train *****'
  puts 'Enter 1 to create a passenger train and 2 freight'
  input = gets.chomp.to_i
  if input == 1
    enter_number_train
    @app.create_passenger_train(@number_train)
    puts "***** Passenger train #{@number_train} created *****"
  elsif input == 2
    enter_number_train
    @app.create_passenger_train(@number_train)
    puts "***** Cargo train #{@number_train} created *****"
  end
rescue RuntimeError => e
  caught_error(e)
end

def make_route
  puts '***** Creation route *****'
  enter_stations_route
  @app.create_route(@first_station, @last_station)
  puts "---------- Route #{@first_station} #{@last_station} created ----------"
rescue RuntimeError => e
  caught_error(e)
end

def route_for_train
  enter_number_train
  enter_stations_route
  @app.route_guidance(@number_train, @first_station, @last_station)
rescue RuntimeError => e
  caught_error(e)
end

def go
  puts '***** The movement of the train forward *****'
  enter_number_train
  @app.forward(@number_train)
rescue RuntimeError => e
  caught_error(e)
end

def back
  puts '***** The movement of trains back *****'
  enter_number_train
  @app.back_station(@number_train)
rescue RuntimeError => e
  caught_error(e)
end

def make_wagon
  puts '***** Creation wagon *****'
  puts 'Enter 1 to create a passenger wagon and 2 trucks to'
  input = gets.chomp.to_i
  if input == 1
    puts 'Enter the number of seats in the wagon'
    place = gets.chomp.to_i
    @app.create_passenger_wagon(place)
    puts '***** Passenger wagon created *****'
  elsif input == 2
    puts 'Enter the volume of the wagon'
    volume = gets.chomp.to_f
    @app.create_cargo_wagon(volume)
    puts '***** Cargo wagon created *****'
  end
end

def add_wag
  puts '***** Adding wagons *****'
  enter_number_train
  @app.add_wagon(@number_train)
rescue RuntimeError => e
  caught_error(e)
end

def remove_wag
  puts '***** Uncoupling of wagons ******'
  enter_number_train
  @app.detach_wagon(@number_train)
rescue RuntimeError => e
  caught_error(e)
end

def list_train_on_station
  enter_name_station
  @app.trains_on_station(@station)
rescue RuntimeError => e
  caught_error(e)
end

def place_in_wagon
  enter_number_train
  @app.volume_wagon(@number_train)
end

def every_train
  enter_name_station
  @app.station_collection[@station].each_train
end
