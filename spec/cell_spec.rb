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

  describe '#fired_upon' do
    it 'is not fired upon' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.fired_upon?).to be false
    end

    it 'lose health when fired upon' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.ship.health).to eq(3)
      cell.fire_upon
      expect(cell.ship.health).to eq(2)
      expect(cell.fired_upon?).to be true
    end
  end

  describe '#render' do
    it 'tells you if you what happens' do
      cell_1 = Cell.new("B4")
      cell_1.render
      expect(cell_1.render).to eq('.')
      cell_1.fire_upon
      expect(cell_1.render).to eq('M')
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      cell_2.render
      expect(cell_2.render).to eq('.')
      expect(cell_2.render(true)).to eq('S')
      cell_2.fire_upon
      expect(cell_2.render).to eq('H')
      expect(cruiser.sunk?).to eq(false)
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to eq(true)
      expect(cell_2.render).to eq('X')
    end

  end
end