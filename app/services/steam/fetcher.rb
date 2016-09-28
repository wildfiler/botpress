module Steam
  class Fetcher
    def initialize(request: Steam::InventoryRequest.new)
      @request = request
    end

    def get(bot_id, app_id)
      result = @request.get(bot_id, app_id)

      items = result['rgInventory']
      items_description = result['rgDescriptions']

      items.map do |(_, item)|
        id = "#{item['classid']}_#{item['instanceid']}"
        raw_description = items_description[id]
        next if raw_description['tradable'] != 1
        item['raw'] = raw_description
        item
      end.compact
    end
  end
end
