require 'rails_helper'

describe 'user visit account game page' do
  it 'sees all items from all bots' do
    game = create(:game)
    this_game_items = create_list :item, 2, game: game
    item_from_other_game = create :item

    visit game_path(game)
    this_game_items.each do |item|
      expect(page).to have_css('.item', text: item.id)
    end
    expect(page).not_to have_css('.item', text: item_from_other_game.id)
  end
end
