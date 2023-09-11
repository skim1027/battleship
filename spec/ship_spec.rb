# require './lib/ship'
require './spec/spec_helper'

RSpec.describe 'Ship' do
  describe '#initialize' do 
    it 'exists' do 
      cruiser = Ship.new('Cruiser', 3)
      expect(cruiser).to be_instance_of(Ship)
    end
    
    it 'has a name' do 
      cruiser = Ship.new('Cruiser', 3)
      expect(cruiser.name).to eq('Cruiser')
    end
    
    it 'has a length' do
      cruiser = Ship.new('Cruiser', 3)
      expect(cruiser.length).to eq(3)
    end
    
    it 'has health' do
      cruiser = Ship.new('Cruiser', 3)
      expect(cruiser.health).to eq(3)
    end
    
    it 'has not sunk' do
      cruiser = Ship.new('Cruiser', 3)
      expect(cruiser.sunk?).to eq(false)
    end
  end
  
  describe '#hit' do
    it 'can take a hit' do 
      cruiser = Ship.new('Cruiser', 3)
      expect(cruiser.health).to eq(3)
      cruiser.hit
      expect(cruiser.health).to eq(2)
    end
    
    it 'can be sunk' do 
      cruiser = Ship.new('Cruiser', 3)
      expect(cruiser.health).to eq(3)
      cruiser.hit
      expect(cruiser.health).to eq(2)
      expect(cruiser.sunk?).to eq(false)
      cruiser.hit
      expect(cruiser.health).to eq(1)
      expect(cruiser.sunk?).to eq(false)
      cruiser.hit
      expect(cruiser.health).to eq(0)
      expect(cruiser.sunk?).to eq(true)
    end
  end
end