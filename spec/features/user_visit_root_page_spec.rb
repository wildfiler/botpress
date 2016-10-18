require 'rails_helper'

describe 'user visit root page' do
  it 'sees 10 last items for all games' do
    game1, game2 = create_list(:game, 2)
    game1_items = create_list(:item, 3, game: game1)
    game2_items = create_list(:item, 3, game: game2)

    visit '/'
    expect(page).to have_content(game1.name)
    expect(page).to have_content(game2.name)
    items_content(game1_items)
    items_content(game2_items)
  end

  it 'sees items count for each game' do
    game = create :game
    create_list :item, 3, game: game

    visit '/'

    expect(page).to have_css('.items_total', text: game.items.count)
  end

  def items_content(items)
    items.each do |item|
      expect(page).to have_content(item.name)
    end
  end
end
