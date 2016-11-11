require 'rails_helper'

describe 'visit admin items page' do
  it 'sees list of all items' do
    game = create(:game)
    items = create_list(:item, 3, game: game)

    visit admin_items_path(as: create(:user, :admin))

    items.each do |item|
      expect(page).to have_link(item.name, href: admin_item_path(item))
    end
  end
end
