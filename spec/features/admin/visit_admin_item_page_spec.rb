require 'rails_helper'

describe 'vitsit admin item page' do
  it 'sees item info' do
    raw = "<div class='class'> rawww </div>"
    icon_large_url = 'large_url'
    icon_url = 'icon_url'
    description = "<div class='class'> rawww </div>"
    market_hash_name = 'Sawed-Off | Bamboo Shadow'
    item = create(:item,
                  raw: raw,
                  icon_large_url: icon_large_url,
                  icon_url: icon_url,
                  description: description,
                  market_hash_name: market_hash_name)
    visit admin_item_path(item, as: create(:user, :admin))

    expect(page).to have_content(item.name)
    expect(page).to have_content(item.game.name)
    expect(page).to have_content(raw)
    expect(page).to have_content(description)
    expect(page).to have_link('Large icon', href: item.icon_large_url)
    expect(page).to have_link('Small icon', href: item.icon_url)
    expect(page).to have_link('View at Steam Market', href: item.steam_link)
  end
end
