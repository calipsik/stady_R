require_relative "manufacturer"

class Wagon
  include Manufacturer
  attr_reader :number, :type

  def initialize(number)
    @number = number
    validate!
  end

  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  protected

  def validate!
    raise "Вагон не может быть без номера!" if self.number.empty? || self.number.nil?
  end
end