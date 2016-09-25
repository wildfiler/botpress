require 'rails_helper'

describe GameForAccount do
  it 'fetches all items from account' do
    account = create(:account)
    bot = create(:bot, account: account)
    game = create(:game)
    item = create(:item, bot: bot, game: game)
    _another_bot_item = create(:item, game: game)

    game_for_account = GameForAccount.new(game, account)

    expect(game_for_account.items).to eq([item])
  end
end
