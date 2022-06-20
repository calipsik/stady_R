require_relative "instance_counter"

class Station
  include InstanceCounter
  include Valid
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @trains = []
    @@all << self
    register_instance
    validate!
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
    self.trains.count { |train| train.cargo? }
  end

  def passenger_trains_amount
    self.trains.count { |train| train.passenger? }
  end

  def cargo_trains_list
    self.trains.select { |train| train.cargo? }
  end

  def passenger_trains_list
    self.trains.select { |train| train.passenger? }
  end

  def trains
    block_given? ? @trains.each { |train| yield(train) } : @trains
  end
  
  private

  def validate!
    raise "Станция не может быть без названия!" if self.name.empty? || self.name.nil?
  end
end