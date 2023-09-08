class Cell
  attr_reader :coordinate, :empty
  attr_accessor :ship
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

  def render(render = true)
    empty? == false && render == true
      'S'
    if !@fired_upon
      '.'
    elsif @fired_upon && ship == nil
        'M'
    end
  end
end