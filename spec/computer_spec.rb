require './spec/spec_helper'

RSpec.describe Computer do 
  describe '#initialize' do
    it 'exists' do 
      computer = Computer.new
      expect(computer).to be_instance_of(Computer)
    end
  end

  describe '#place ships' do
    it 'places cruiser on board' do 
      computer = Computer.new
      board = board.new
      cruiser = Ship.new(cruiser, 3)

    end 
    it 'places submarine on board' do 
      computer = Computer.new
      board = board.new
      submarine = Ship.new(submarine, 2)

    end 
    it 'places both ships on board' do
      computer = Computer.new
      board = board.new
      cruiser = Ship.new(cruiser, 3)
      submarine = Ship.new(submarine, 2)

    end
  end
  describe '#takes a turn' do 
    it "fire on a random cell" do 

    end

  end

end

