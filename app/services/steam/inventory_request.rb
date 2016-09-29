module Steam
  class InventoryRequest
    class WrongResponse < StandardError; end

    STEAM_PROFILE_URL =
      'http://steamcommunity.com/profiles/%{id}/inventory/json/%{app_id}/%{app_context}'.freeze

    attr_reader :client

    def initialize(client: HTTParty)
      @client = client
    end

    def get(id, app_id, app_context = Steam::MAIN_CONTEXT_ID)
      url = STEAM_PROFILE_URL % { id: id, app_id: app_id, app_context: app_context }
      response = @client.get(url)

      raise TooManyRequests if response.code == 429
      raise WrongResponse unless response.code == 200

      response.parsed_response
    end
  end
end
