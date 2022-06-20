require_relative "manufacturer"

class Wagon
  include Manufacturer
  include Valid
  attr_reader :number, :type

  def initialize(number)
    @number = number
    validate!
  end

  def cargo?
    self.type == :cargo
  end

  def passenger?
    self.type == :passenger
  end

  protected

  def validate!
    raise "Вагон не может быть без номера!" if self.number.empty? || self.number.nil?
  end
end