require 'rails_helper'

describe GameHelper do
  describe '#games_options' do
    it "returns list of all games name with id's" do
      game1, game2 = create_list(:game, 2)
      expect(helper.games_options).to match_array(
        [[game1.name, game1.id], [game2.name, game2.id]]
      )
    end
  end
end
