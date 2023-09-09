require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

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
end