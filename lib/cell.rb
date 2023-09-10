class Cell
  attr_reader :coordinate
  attr_accessor :ship, :empty, :fired_upon 
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if ship != nil
      ship.hit
    end
    @fired_upon = true
  end

  def render(render = false)
    if @fired_upon && ship != nil && ship.sunk?
      'X'
    elsif @fired_upon && ship != nil
      'H'
    elsif @fired_upon && ship == nil
      'M'
    elsif render == true && ship != nil
      'S'
    else
      '.'
    end
  end
end
