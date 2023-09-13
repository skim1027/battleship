require './spec/spec_helper'

RSpec.describe Play do
  describe '#initialize' do
    it 'exists and is the correct class' do
      game = Play.new
      expect(game).to be_instance_of(Play)
    end
  end
end