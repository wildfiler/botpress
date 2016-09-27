require 'rails_helper'

describe AccountWithGames do
  it ' returns account with items from games' do
    account = create(:account)
    game = create(:game, :published)
    bot1, bot2 = create_list(:bot, 2, account: account)
    bot1_item = create(:item, bot: bot1, game: game)
    bot2_item = create(:item, bot: bot2, game: game)
    _another_game_item = create(:item, bot: bot1, game: create(:game))
    _another_bot_item = create(:item, bot: create(:bot), game: game)

    account_with_games = AccountWithGames.new(account)

    game_from_account = account_with_games.games.detect { |i| i[:id] = game.id }

    expect(game_from_account.items).to match_array([bot1_item, bot2_item])
  end
end
