require 'rails_helper'

describe 'user visit bot game page' do
  it 'sees only games that belongs to this bot and game' do
    bot = create :bot
    game = create :game
    items = create_list :item, 2, bot: bot, game: game
    not_this_game_item = create :item, bot: bot
    not_this_bot_item = create :item, game: game
    other_item = create :item

    visit bot_game_path(bot, game)
    expect(page).to have_content(bot.name)
    expect(page).to have_content(game.name)
    items.each do |item|
      expect(page).to have_content(item.name)
    end
    expect(page).not_to have_content(not_this_game_item.name)
    expect(page).not_to have_content(not_this_bot_item.name)
    expect(page).not_to have_content(other_item.name)
  end
end
