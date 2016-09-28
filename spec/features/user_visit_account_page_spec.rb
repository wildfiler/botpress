require 'rails_helper'

describe 'user visit account page' do
  it 'sees games from all bots that belongs to this account' do
    account = create :account
    game = create :game, :published
    bot1, bot2 = create_list :bot, 2, account: account
    bot1_items = create_list :item, 2, bot: bot1, game: game
    bot2_items = create_list :item, 2, bot: bot2, game: game

    visit account_path(account)

    expect(page).to have_css('.account_name', text: account.id)
    expect(page).to have_css('.games_list', text: game.name)
    bot_content(bot1_items)
    bot_content(bot2_items)
  end

  def bot_content(items)
    items.each do |item|
      expect(page).to have_css('.item', text: item.id)
    end
  end
end
