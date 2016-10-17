require 'rails_helper'

describe 'user visit item page' do
  it 'sees item info' do
    game = create(:game)
    desc_class = 'desc'
    desc_text = 'description'
    description = "<div class='#{desc_class}'> #{desc_text} </div>"
    item = create(:item, game: game, description: description)
    visit game_item_path(game, item)

    expect(page).to have_content(game.name)
    expect(page).to have_content(item.name)
    expect(page).to have_content(item.item_type)
    expect(page).to have_css(".#{desc_class}", text: desc_text)
    expect(page).to have_css("img[src='#{item.icon_large_url}']")
  end
end
