require 'rails_helper'

describe BotWithGames do
  it 'fetches all games' do
    bot = build_stubbed(:bot)
    games = build_stubbed_list(:game, 3)
    allow(Game).to receive(:published).and_return(games)

    bot_with_games = BotWithGames.new(bot)

    expect(bot_with_games.games.map(&:id)).to match_array(games.map(&:id))
  end

  describe 'games' do
    it 'returns game with items from bot' do
      bot = create(:bot)
      game = create(:game)
      item = create(:item, bot: bot, game: game)
      _another_game_item = create(:item, bot: bot, game: create(:game))
      _another_bot_item = create(:item, bot: create(:bot), game: game)
      allow(Game).to receive(:published).and_return([game])

      bot_with_games = BotWithGames.new(bot)

      game = bot_with_games.games.first

      expect(game.items).to eq [item]
    end
  end
end

describe BotWithGames::GameForBot do
  it 'fetches all items for bot' do
    bot = create(:bot)
    game = create(:game)
    item = create(:item, bot: bot, game: game)
    _another_bot_item = create(:item, bot: create(:bot), game: game)

    game_for_bot = BotWithGames::GameForBot.new(game, bot)

    expect(game_for_bot.items).to eq [item]
  end
end
