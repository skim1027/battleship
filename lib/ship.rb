class Ship
  attr_reader :name, :length, :health, :sunk
  def initialize(name, length) 
    @name = name
    @length = length
    @health = @length
    @sunk = false
  end

  def hit
    @health -= 1
  end

  def sunk?
    if @health == 0
      true  
    else
      false
    end
  end
end