require_relative "manufacturer"
require_relative "instance_counter"

class Train
  include Manufacturer
  include InstanceCounter
  include Valid
  attr_reader :number, :speed, :current_station, :type

  FORMAT_NUMBER = /^[а-яa-z0-9]{3}-*[а-яa-z0-9]{2}$/i
  
  @@all = []

   def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @@all << self
    register_instance
    validate!
  end

  def self.all
    @@all
  end

  def self.find(train_number)
    @@all.each { |train| return train if train.number.downcase == train_number.downcase}
    nil
  end

  def start(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def add_wagon(wagon)
    @wagons << wagon if self.speed == 0 && wagon.type == self.type
  end

  def del_wagon(wagon)
    @wagons.delete(wagon) if self.speed == 0
  end

  def assign_route(route)
    @route = route
    @current_station = route.stations.first
    @current_station.add_train(self)
  end

  def move_next_station
    station = next_station
    if station
      @current_station.del_train(self)
      @current_station = station
      station.add_train(self)
    else 
      raise "\nНельзя переместить поезд на следующую станцию"
    end
  end

  def move_prev_station
    station = prev_station
    if station
      @current_station.del_train(self)
      @current_station = station
      station.add_train(self)
    else 
      raise "\nНельзя переместить поезд на предыдущую станцию"
    end
  end

  def next_station
    index = @route.stations.index(self.current_station)
    @route.stations[index + 1] if index && index != @route.stations.size - 1
  end

  def prev_station
    index = @route.stations.index(self.current_station)
    @route.stations[index - 1] if index && index > 0
  end

  def cargo?
    self.type == :cargo
  end

  def passenger?
    self.type == :passenger
  end

  def wagons
    return @wagons unless block_given?
    @wagons.each { |wagon| yield(wagon) }
  end

  protected

  def validate!
    raise "Поезд не может быть без номера!" if self.number.empty? || self.number.nil?
    raise "Некорректный формат номера поезда!" if self.number !~ FORMAT_NUMBER
  end
end