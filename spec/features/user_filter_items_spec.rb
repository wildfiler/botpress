require 'rails_helper'

describe 'user visit game page' do
  it 'can find item with filters' do
    game = create(:game)
    filter_type = create(:filter_type, game_id: game.id)
    filter_value = create(:filter_value, filter_type_id: filter_type.id)
    searched_item = create(:item, game: game)
    searched_item.filter_values = [filter_value]
    other_item = create(:item, game: game)
    visit game_path(game)
    check(filter_value.value)
    click_on('Filter')

    expect(page).to have_content(searched_item.name)
    expect(page).not_to have_content(other_item.name)
  end
end
