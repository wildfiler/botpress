require 'rails_helper'

describe SteamImporter do
  it 'creates items from steam inventory' do
    bot = create(:bot)
    game = create(:game)
    fetcher = instance_double(Steam::Fetcher)
    item = {
      'id' => '1',
      'classid' => '2',
      'instanceid' => '3',
      'amount' => '1',
      'raw' => {
        'descriptions' => []
      }
    }
    allow(fetcher).to receive(:get).with(bot.steam_id, game.app_id).and_return([item])

    importer = SteamImporter.new([bot], fetcher: fetcher)

    allow(Game).to receive(:published).and_return([game])

    expect do
      importer.import
    end.to change { bot.items.reload.count }.by 1
  end

  it 'creates items from steam inventory for different games' do
    bot = create(:bot)
    games = create_list(:game, 2)
    fetcher = instance_double(Steam::Fetcher)

    item1 = {
      'id' => '1',
      'classid' => '2',
      'instanceid' => '3',
      'amount' => '1',
      'raw' => {
        'descriptions' => []
      }
    }

    item2 = {
      'id' => '2',
      'classid' => '2',
      'instanceid' => '3',
      'amount' => '1',
      'raw' => {
        'descriptions' => []
      }
    }

    allow(fetcher).to receive(:get).with(bot.steam_id, games.first.app_id).and_return([item1])
    allow(fetcher).to receive(:get).with(bot.steam_id, games.second.app_id).and_return([item2])

    importer = SteamImporter.new([bot], fetcher: fetcher)

    allow(Game).to receive(:published).and_return(games)

    expect do
      importer.import
    end.to change { bot.items.reload.count }.by 2
    expect(games.first.items.count).to eq 1
  end

  it 'creates only new items from steam inventory' do
    bot = create(:bot)
    game = create(:game)
    fetcher = instance_double(Steam::Fetcher)

    item = create(:item, bot: bot, game: game)

    item1 = {
      'id' => item.steam_id.to_s,
      'classid' => item.classid.to_s,
      'instanceid' => item.instanceid.to_s,
      'amount' => item.amount.to_s,
      'raw' => item.raw
    }

    item2 = {
      'id' => '1',
      'classid' => '2',
      'instanceid' => '3',
      'amount' => '1',
      'raw' => {
        'descriptions' => []
      }
    }

    allow(fetcher).to receive(:get).with(bot.steam_id, game.app_id).and_return([item1, item2])

    importer = SteamImporter.new([bot], fetcher: fetcher)

    allow(Game).to receive(:published).and_return([game])

    expect(bot.items.count).to eq 1
    expect do
      importer.import
    end.to change { bot.items.reload.count }.by 1
  end

  it 'deletes old items from steam inventory' do
    bot = create(:bot)
    game = create(:game)
    fetcher = instance_double(Steam::Fetcher)

    _item = create(:item, bot: bot, game: game)

    item2 = create(:item, bot: bot, game: game)

    item2_hash = {
      'id' => item2.steam_id.to_s,
      'classid' => item2.classid.to_s,
      'instanceid' => item2.instanceid.to_s,
      'amount' => item2.amount.to_s,
      'raw' => item2.raw
    }

    allow(fetcher).to receive(:get).with(bot.steam_id, game.app_id).and_return([item2_hash])

    importer = SteamImporter.new([bot], fetcher: fetcher)

    allow(Game).to receive(:published).and_return([game])

    expect(bot.items.count).to eq 2
    expect do
      importer.import
    end.to change(bot.items.reload, :count).by(-1)
    expect(bot.items.count).to eq 1
    expect(bot.items.reload).to eq [item2]
  end
end
