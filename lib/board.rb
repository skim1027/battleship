require './spec/spec_helper'
class Board
  attr_reader :cells
  attr_accessor :cells
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
    if cells.include?(coordinate) && cells[coordinate].fired_upon == false
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
      letters << separate.first.ord
      numbers << separate.last.to_i
      if valid_coordinates?(space) == false
        return false
      end
      if cells[space].ship != nil
        return false
      end
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
      elsif numbers.all? { |number| number == numbers[0] } 
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
          else
            false
          end
          ship
        end
      end
    end
  end

  def render(render = false)
    board_info = cells.values
    if render == true
      full_board = [
        [" ", "1", "2", "3", "4"].join(" "),
        ["A", board_info[0].render(true), board_info[1].render(true), board_info[2].render(true), board_info[3].render(true) ].join(" "),
        ["B", board_info[4].render(true), board_info[5].render(true), board_info[6].render(true), board_info[7].render(true) ].join(" "),
        ["C", board_info[8].render(true), board_info[9].render(true), board_info[10].render(true), board_info[11].render(true) ].join(" "),
        ["D", board_info[12].render(true), board_info[13].render(true), board_info[14].render(true), board_info[15].render(true), "\n" ].join(" ")
      ].join(" \n")  
    else
      full_board = [
        [" ", "1", "2", "3", "4"].join(" "),
        ["A", board_info[0].render, board_info[1].render, board_info[2].render, board_info[3].render ].join(" "),
        ["B", board_info[4].render, board_info[5].render, board_info[6].render, board_info[7].render ].join(" "),
        ["C", board_info[8].render, board_info[9].render, board_info[10].render, board_info[11].render ].join(" "),
        ["D", board_info[12].render, board_info[13].render, board_info[14].render, board_info[15].render, "\n" ].join(" ")
      ].join(" \n")
    end
  end
    
  def fire(coordinate)
    board_info = cells
    if valid_coordinates?(coordinate) == true 
      if board_info[coordinate].fired_upon == false
        board_info[coordinate].fire_upon
      end
    end
  end

  def render_reformat(render = false)
    board_info = cells.values
    if render == true
      full_board = board_info
      [
        [" ", "1", "2", "3", "4", "\n"].join(" ") +
        ["A", board_info[0].render(true), board_info[1].render(true), board_info[2].render(true), board_info[3].render(true), "\n" ].join(" ") + 
        ["B", board_info[4].render(true), board_info[5].render(true), board_info[6].render(true), board_info[7].render(true), "\n" ].join(" ") + 
        ["C", board_info[8].render(true), board_info[9].render(true), board_info[10].render(true), board_info[11].render(true), "\n" ].join(" ") + 
        ["D", board_info[12].render(true), board_info[13].render(true), board_info[14].render(true), board_info[15].render(true), "\n" ].join(" ")
      ].join(" \n")
    else
      full_board = board_info
      [
        [" ", "1", "2", "3", "4", "\n"].join(" ") +
        ["A", board_info[0].render, board_info[1].render, board_info[2].render, board_info[3].render, "\n"].join(" ") +
        ["B", board_info[4].render, board_info[5].render, board_info[6].render, board_info[7].render, "\n" ].join(" ") + 
        ["C", board_info[8].render, board_info[9].render, board_info[10].render, board_info[11].render, "\n" ].join(" ") +
        ["D", board_info[12].render, board_info[13].render, board_info[14].render, board_info[15].render, "\n" ].join(" ")
      ].join(" \n")
    end
  end
end



