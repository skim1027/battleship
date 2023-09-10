class Cell
  attr_reader :coordinate
  attr_accessor :ship, :empty 
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
    if render == true && ship != nil
      'S'
    elsif @fired_upon && ship != nil && ship.sunk?
      'X'
    elsif @fired_upon && ship == nil
      'M'
    elsif @fired_upon && ship != nil
      'H'
    else
      '.'
    end
  end
end
