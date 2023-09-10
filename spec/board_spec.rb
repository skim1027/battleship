require './lib/board'
require './lib/cell'
require './lib/ship'


RSpec.describe Board do 
  describe '#initialize' do
    it 'exists' do
      board = Board.new
      expect(board).to be_instance_of(Board)
    end

    it 'board has cells' do
      board = Board.new
      expect(board.cells).to be_instance_of(Hash)
      expect(board.cells.keys.count).to eq(16)
      expect(board.cells.values.first.class).to eq(Cell)
    end
  end

  describe '#valid_coordinates?' do
    it 'shows if coordinate is valid or not' do
      board = Board.new
      expect(board.valid_coordinates?('A1')).to be true
      expect(board.valid_coordinates?('D4')).to be true
      expect(board.valid_coordinates?('A5')).to be false
      expect(board.valid_coordinates?('E1')).to be false
      expect(board.valid_coordinates?('A22')).to be false
    end
  end

  describe '#valid_ship_placements' do 
    it 'length of ship matches amount of coordinates' do 
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'coordinates are consecutive' do 
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq false
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq false
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq false
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq false
    end

    it 'coordinates can not be diagonal' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq false
      expect(board.valid_placement?(submarine, ["A1", "B2"])).to eq false
    end

    it 'these coordinates are valid' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(cruiser, ["B1", "B2", "B3"])).to eq true
      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq true
    end
  end
  describe '#place ships' do
    it 'places ship on the board' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)   
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"] 
      expect(cell_1).to be_instance_of(Cell)
      expect(cell_2).to be_instance_of(Cell)
      expect(cell_3).to be_instance_of(Cell)
      expect(cell_1.ship).to be_instance_of(Ship)
      expect(cell_2.ship).to be_instance_of(Ship)
      expect(cell_3.ship).to be_instance_of(Ship)
      expect(cell_3.ship == cell_2.ship).to be true
    end
  end

  describe '#place ships' do
    it 'places ship on the board' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)   
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"] 
      expect(cell_1).to be_instance_of(Cell)
      expect(cell_2).to be_instance_of(Cell)
      expect(cell_3).to be_instance_of(Cell)
      expect(cell_1.ship).to be_instance_of(Ship)
      expect(cell_2.ship).to be_instance_of(Ship)
      expect(cell_3.ship).to be_instance_of(Ship)
      expect(cell_3.ship == cell_2.ship).to be true
    end
  end

  describe '#overlapping ships' do
    it 'will not let ships overlap' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(submarine, ["A1", "B1"])).to be false
    end
  end
end