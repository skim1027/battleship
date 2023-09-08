require './lib/ship'
require 'pry'

RSpec.describe Ship do
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end
  
  describe '#initialize' do
    it 'initialize' do
      expect(@cruiser).to be_instance_of(Ship)
    end

    it 'has a name' do
      expect(@cruiser.name).to eq('Cruiser')
    end

    it 'shows length' do
      expect(@cruiser.length).to eq(3)
    end
  end

  describe '#health' do
    it 'shows health' do
      expect(@cruiser.health).to eq(3)
    end

    it 'decrease when hit' do
      @cruiser.hit
      expect(@cruiser.health).to eq(2)
      @cruiser.hit
      expect(@cruiser.health).to eq(1)
    end
  end

  describe '#sunk?' do
    it 'is not sunk' do
      expect(@cruiser.sunk?).to be false
    end

    it 'sunk after 3 hits' do
      @cruiser.hit
      @cruiser.hit
      @cruiser.hit
      expect(@cruiser.sunk?).to be true
    end
  end
end