module Steam
  class Fetcher
    RETRY_TIMES = 12

    def initialize(request: Steam::InventoryRequest.new)
      @request = request
    end

    def get(bot_id, app_id)
      result = get_inventory(bot_id, app_id)

      return [] if result.blank?

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

    private

    def get_inventory(bot_id, app_id)
      retry_count = 0
      begin
        @request.get(bot_id, app_id)
      rescue InventoryRequest::WrongResponse
        Rails.logger.info "Wrong response for bot(#{bot_id}) and game(#{app_id})"
        []
      rescue Steam::TooManyRequests
        retry_count += 1
        if retry_count < RETRY_TIMES
          sleep 5
          retry
        end
        Rails.logger.info "Unable to get inventory for bot(#{bot_id}) and game(#{app_id})"
        []
      end
    end
  end
end
