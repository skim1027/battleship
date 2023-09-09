class Board
  attr_reader :cells
  def initialize
    @cells = cells
  end

  def cells
    cells = {}
    keys = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']
    keys.each do |key|
      cells[key] = Cell.new(key)
    end
    cells
  end

  def valid_coordinates?(coordinate)
    if cells.include?(coordinate)
      true
    else
      false
    end
  end

  def valid_placement?(ship, coordinate)
    letters = []
    numbers = []
    coordinate.each do |space|
      separate = space.split('')
      letters << separate.first
      numbers << separate.last.to_i
    end
    
    if ship.length == coordinate.length 
      #first the ship needs to be the length as the coordinate
      if letters.all? { |letter| letter == letters[0] } && numbers == numbers.min..numbers.max


        #letters are the same && numbers consecutive
      elsif numbers.all? { |number| number == number[0] } && letters == letters.min..letters.max
        #letters are consecutive && numbers are the same
      end
    else
      false
    end
  end
end