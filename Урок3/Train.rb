class Train
  attr_accessor :current_station
  attr_reader :speed, :number_cars, :next_station, :prev_station

  def initialize(number_train, type_train = :freight || :passenger, number_cars)
    @number_train = number_train
    @type_train = type_train
    @number_cars = number_cars
    @speed = 0
  end

  def up_speed(speed = 70)
    @speed = speed
    puts @speed
  end

   def stop
    @speed = 0
    puts @speed
  end

  def set_up_number_cars
    @number_cars += 1 if @speed == 0
  end

  def set_down_number_cars
    @number_cars -= 1 if @speed == 0
  end

  def get_route(route)
    @route = route
    @current_station = route.start_station
    puts "текущая станция #{@current_station}"
  end

  def next_station
    @route.stations[@route.stations.index(@current_station) + 1] if @current_station != @route.end_station
  end

  def prev_station
    @route.stations[@route.stations.index(@current_station) - 1] if @current_station != @route.start_station
  end

  def go_next
    up_speed
    @current_station = next_station if @current_station != @route.end_station
    stop
    puts "поезд прибывает на станцию #{@current_station}"
  end

  def go_prev
    up_speed
    @current_station = prev_station if @current_station != @route.start_station
    puts "поезд прибывает на станцию #{@current_station}"
    stop
  end
end