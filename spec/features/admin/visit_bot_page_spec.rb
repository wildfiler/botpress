require 'rails_helper'

describe 'admin visit bot page' do
  it 'sees bot info' do
    admin = create(:user, :admin)
    account = create(:account)
    _user = create(:user, account: account)
    game1, game2 = create_list(:game, 2)
    bot = create(:bot, account: account)
    _games_for_game_1 = create_list(:item, 2, bot: bot, game: game1)
    _games_for_game_2 = create_list(:item, 3, bot: bot, game: game2)

    visit admin_bot_path(bot, as: admin)
    expect(page).to have_content(bot.name)
    expect(page).to have_content(bot.steam_id)
    expect(page).to have_content(account.name)
    expect(page).to have_link(account.id, href: admin_account_path(account))
    expect(page).to have_link(game1.name, href: game_path(game1))
    expect(page).to have_link(game2.name, href: game_path(game2))
    expect(page).to have_content(game1.items.count)
    expect(page).to have_content(game2.items.count)
  end
end
