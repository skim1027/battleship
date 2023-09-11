require './spec/spec_helper'
class Ship
  attr_reader :name, :length
  attr_accessor :health, :sunk
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end

  def sunk?
    if @health > 0 
      false
    else 
      true
    end
  end

  def hit
    @health -= 1
  end
end

