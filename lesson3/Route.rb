class Route
  attr_reader :start_station, :end_station, :stations

  def initialize (start_station, end_station)
    @start_station = start_station #начальная станция
    @end_station = end_station # конечная станция
    @stations = [start_station, end_station] #список всех станций в маршруте
  end

  def set_way_station(way_station) #добавляет промежуточную станцию в маршрут
    @stations.insert(-2, way_station)
  end

  def delete_station(del_station)
    @stations.delete_if { |name| name == del_station } #удаляет промежуточную станцию в маршруте
  end
end