class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def del_train(train)
    @trains.delete(train)
  end

  def cargo_trains_amount
    trains_amount(CargoTrain)
  end

  def passenger_trains_amount
    trains_amount(PassengerTrain)
  end

  def cargo_trains_list
    train_list(CargoTrain)
  end

  def passenger_trains_list
    train_list(PassengerTrain)
  end
  
  private

  # для подсчета поездов вне класса созданы public методы которые прячут от пользователя вызов этотого параметра и передают его данному private методу
  # метод private, а не protected так как у класса Station не предполагются наследники
  def train_list(class_name)
    self.trains.select { |train| train.is_a?(class_name) }
  end

  def trains_amount(class_name)
    self.trains.count { |train| train.is_a?(class_name) }
  end
end