require_relative 'main'

loop do
  puts "Enter number:\n1 - to create a station"
  puts "2 - to create a train\n3 - to create a route"
  puts "4 - to add a route to the train\n5 - to move the train forward"
  puts "6 - for the train back\n7 - for creating wagons"
  puts '8 - add the wagons of the train'
  puts '9 - remove the carriages from the train'
  puts '10 - view all station'
  puts "11 - view the train station\n12 - add passengers or cargo in the wagons"
  puts '13 - view information about train'
  puts '14 - the enumeration of all trains at the station'
  puts '15 - Exit'

  input = gets.chomp.to_i
  break if input == 15
  case input

  when 1
    make_station

  when 2
    make_train

  when 3
    make_route

  when 4
    route_for_train

  when 5
    go

  when 6
    back

  when 7
    make_wagon

  when 8
    add_wag

  when 9
    remove_wag

  when 10
    @app.stations_list

  when 11
    list_train_on_station

  when 12
    place_in_wagon

  when 13
    enter_number_train
    @app.see_train(@number_train)

  when 14
    every_train

  end
end
