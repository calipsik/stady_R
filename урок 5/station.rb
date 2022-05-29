require_relative "instance_counter"

class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@all = []

  def initialize(name)
    @name = name
    @trains = []
    @@all << self
    register_instance
  end

  def self.all
    @@all
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

  def train_list(class_name)
    self.trains.select { |train| train.is_a?(class_name) }
  end

  def trains_amount(class_name)
    self.trains.count { |train| train.is_a?(class_name) }
  end
end