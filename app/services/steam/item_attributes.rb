module Steam
  class ItemAttributes
    attr_reader :game, :item

    def initialize(game, item)
      @game = game
      @item = item
    end

    def to_h
      attributes_definitions.each_with_object({}) do |(name, value), result|
        result[name] = value.call
      end
    end

    private

    def attributes_definitions
      {
        game: -> { game },
        steam_id: -> { item['id'] },
        classid: -> { item['classid'] },
        instanceid: -> { item['instanceid'] },
        amount: -> { item['amount'] },
        raw: -> { item['raw'] },
        name: -> { raw['name'] },
        description: -> { description(raw['descriptions']) },
        market_hash_name: -> { raw['market_hash_name'] },
        icon_url: -> { raw['icon_url'] },
        icon_large_url: -> { raw['icon_url_large'] },
        item_type: -> { raw['type'] },
        name_color: -> { raw['name_color'] },
        background_color: -> { raw['background_color'] }
      }
    end

    def raw
      item['raw']
    end

    def description(descriptions)
      return descriptions if descriptions.is_a?(String)
      descriptions.map do |desc|
        color = ''.freeze
        color = "style='color: ##{desc['color']}'" if desc['color']
        "<div class='descriptor' #{color}> #{desc['value']} </div>"
      end.join("\n")
    end
  end
end
