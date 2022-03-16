class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def set_train(train) #принимает поезд на станцию
    @trains << train
  end

  def show_trains # показывает список всех поездов находящихся на станции
   @trains.each { |train| puts train}
  end

  def get_type_trains(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train) #отправляет поезд со станции и удаляет его из списка
    @trains.delete(train)
  end
end
