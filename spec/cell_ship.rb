require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Cell do 
  describe '#initialize' do
    it 'exists' do 
      cell = Cell.new('B4')
      expect(cell).to be_instance_of(Cell)
    end
    it 'has a coordinate' do 
      cell = Cell.new('B4')
      expect(cell.coordinate).to eq('B4')
    end
    it 'has a ship' do 
      cell = Cell.new('B4')
      expect(cell.ship).to eq(nil)
    end
    it 'is empty' do 
      cell = Cell.new('B4')
      expect(cell.empty?).to eq(true)
    end
  end
  describe '#place_ship' do
  it 'can place a ship in a cell' do
    cell = Cell.new('B4')
    cruiser = Ship.new("Cruiser", 3)
    expect(cell.empty?).to eq(true)
    expect(cell.ship).to eq(nil)
    cell.place_ship(cruiser)
    expect(cell.ship).to be_instance_of(Ship)
    expect(cell.empty?).to eq(false)
    end
  end
end