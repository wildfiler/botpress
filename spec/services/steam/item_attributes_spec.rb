require 'rails_helper'

describe Steam::ItemAttributes do
  it 'returns correct attributes for item' do
    item_hash = {
      id: double(:id),
      classid: double(:classid),
      instanceid: double(:instanceid),
      amount: double(:amount),
      raw: {
        descriptions: [],
        name: double(:name),
        market_hash_name: double(:market_hash_name),
        icon_url: double(:icon_large_url),
        icon_large_url: double(:icon_large_url),
        type: double(:type),
        name_color: double(:name_color),
        background_color: double(:background_color)
      }
    }.deep_stringify_keys

    game = double(:game)

    result = Steam::ItemAttributes.new(game, item_hash).to_h

    expect(result).to eq(
      game: game,
      steam_id: item_hash['id'],
      classid: item_hash['classid'],
      instanceid: item_hash['instanceid'],
      amount: item_hash['amount'],
      raw: item_hash['raw'],
      name: item_hash['raw']['name'],
      description: '',
      market_hash_name: item_hash['raw']['market_hash_name'],
      icon_url: item_hash['raw']['icon_url'],
      icon_large_url: item_hash['raw']['icon_url_large'],
      type: item_hash['raw']['type'],
      name_color: item_hash['raw']['name_color'],
      background_color: item_hash['raw']['background_color']
    )
  end

  it 'returns correct description for item' do
    item_hash = {
      raw: {
        descriptions: [
          {
            color: 'AABBCC',
            value: 'description1'
          },
          {
            value: 'description2'
          },
          {
          },
        ]
      }
    }.deep_stringify_keys

    game = double(:game)

    result = Steam::ItemAttributes.new(game, item_hash).to_h

    expect(result).to include(
      description: <<~DESCRIPTION.chop
        <div class='descriptor' style='color: #AABBCC'> description1 </div>
        <div class='descriptor' > description2 </div>
        <div class='descriptor' >  </div>
      DESCRIPTION
    )
  end
end
