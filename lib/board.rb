class Board
  attr_reader :cells
  def initialize
    @cells = cells
  end

  def cells
    @cells ||= begin
    cells = {}
    keys = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']
      keys.each do |key|
        cells[key] = Cell.new(key)
      end
      cells
    end
  end

  def valid_coordinates?(coordinate)
    if cells.include?(coordinate)
      true
    else
      false
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates) == true 
      coordinates.map do |coordinate|
        if valid_coordinates?(coordinate)
          cells[coordinate].ship = ship
          cells[coordinate].empty = false
        end
      end
    end
  end

  def valid_placement?(ship, coordinate)
    letters = []
    numbers = []
    coordinate.each do |space|
      separate = space.split('')
      letters << separate.first.ord
      numbers << separate.last.to_i
    end
    if ship.length == coordinate.length 
      if letters.all? { |letter| letter == letters[0] } 
        outputs = []
        numbers.each_cons(2) do |first, second|
          outputs.push(first + 1 == second)
        end
        if outputs.include?(false)
          false
        else
          true
        end
      elsif numbers.all? { |number| number == number[0] } 
        outputs = []
        letters.each_cons(2) do |first, second|
          outputs.push(first + 1 == second)
        end
        if outputs.include?(false)
          false
        else
          true
        end
      else
        false
      end
    else
      false
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates) == true 
      coordinates.each do |coordinate|
        if valid_coordinates?(coordinate)
          if cells[coordinate].ship == nil && cells[coordinate].empty == true
            cells[coordinate].ship = ship
            cells[coordinate].empty = false
          end
          ship
        end
      end
    end
  end
end
