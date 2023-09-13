require './spec/spec_helper'
class Board

  attr_accessor :cells, :number_cells, :rows, :columns, :number_array
 
  def initialize
    @cells = cells
    @number_cells = number_cells
    @number_array = number_array
    @rows = rows
    @columns = columns

  end

  def make_keys(player_input = 4)
    keys = []
    width = 1..player_input
    height = "A"..((player_input + 64).chr)
    @rows = width.to_a
    @columns = height.to_a
    columns.each do |letter|
      rows.each do |number|
        keys << "#{letter}#{number}"
      end
    end
    keys
  end

  def cells
    @cells ||= begin
    cells = {}
    keys = make_keys
    keys.each do |key|
      cells[key] = Cell.new(key)
    end
    @number_cells = cells.count
    @number_array = (1..cells.count).to_a
      cells
    # require 'pry'; binding.pry
    end
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
      cell_render = @number_array.map { |x| board_info[x-1].render(true) }
      cell_render_arrays = cell_render.each_slice(@rows.count).to_a
      left = @columns.dup
      render_with_letter = cell_render_arrays.map do |array|
        array.insert(0, left.shift).push("\n").join(" ")
      end
      first_row = (@rows.map { |num| num.to_s }).unshift(' ').push("\n").join(" ")
      full_board = render_with_letter.unshift(first_row).flatten.join("")
    else
      cell_render = @number_array.map { |x| board_info[x-1].render }
      cell_render_arrays = cell_render.each_slice(@rows.count).to_a
      left = @columns.dup
      render_with_letter = cell_render_arrays.map do |array|
        array.insert(0, left.shift).push("\n").join(" ")
      end
      first_row = (@rows.map { |num| num.to_s }).unshift(' ').push("\n").join(" ")
      full_board = render_with_letter.unshift(first_row).flatten.join("")
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

end



