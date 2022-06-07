require_relative "instance_counter"

class Route
  include InstanceCounter
  include Valid
  attr_reader :stations

  def initialize(from, to)
    @stations = [from, to]
    register_instance
    validate!
  end

  def add_station(prev_station, station)
    index = @stations.index(prev_station)
    @stations.insert(index + 1, station) if index < @stations.size - 1
  end
  
  def del_station(station)
    @stations.delete(station) if station != @stations[0] && station != @stations[-1]
  end
  
  private

  def validate!
    raise "Некорректный пункт начала маршрута!" if self.stations[0].nil?
    raise "Некорректный пункт конца маршрута!" if self.stations[-1].nil?
  end
end