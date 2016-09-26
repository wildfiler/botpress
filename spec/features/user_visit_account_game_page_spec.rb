require 'rails_helper'

describe 'user visit account game page' do
  it 'sees items of this account for the specific game' do
    account = create(:account)
    bot1, bot2 = create_list(:bot, 2, account: account)
    game = create(:game, :published)
    bot1_items = create_list(:item, 2, bot: bot1, game: game)
    bot2_items = create_list(:item, 2, bot: bot2, game: game)

    visit account_game_path(account, game)

    expect(page).to have_content(account.id)
    expect(page).to have_content(game.name)
    items_content(bot1_items)
    items_content(bot2_items)
  end

  def items_content(items)
    items.each do |item|
      expect(page).to have_content(item.id)
    end
  end
end
