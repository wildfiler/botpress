require 'rails_helper'

describe GameForBot do
  it 'fetches all items for bot' do
    bot = create(:bot)
    game = create(:game)
    item = create(:item, bot: bot, game: game)
    _another_bot_item = create(:item, bot: create(:bot), game: game)

    game_for_bot = BotWithGames::GameForBot.new(game, bot)

    expect(game_for_bot.items).to eq [item]
  end
end
