require 'rails_helper'

describe 'user visit root page' do
  it 'can find item by name' do
    searched_item = create(:item, name: 'gun')
    similar_item = create(:item, name: 'big gun')
    other_item = create(:item, name: 'sitck')
    visit search_index_path

    fill_in 'Item name', with: searched_item.name
    click_on 'Search'

    expect(page).to have_content(searched_item.name)
    expect(page).to have_content(similar_item.name)
    expect(page).not_to have_content(other_item.name)
  end
end
