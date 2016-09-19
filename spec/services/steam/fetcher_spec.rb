require 'rails_helper'

describe Steam::Fetcher do
  describe '#get' do
    it 'returns arrays of items hashes' do
      request_result = load_fixture('inventory_tradable_item')
      request = instance_double(Steam::InventoryRequest)
      allow(request).to receive(:get).and_return(request_result)
      fetcher = Steam::Fetcher.new(request: request)

      result = fetcher.get('steam_id', 'app_id')

      expected_item_hash = {
        id: '7268980338',
        classid: '231711804',
        instanceid: '253036912',
        amount: '1',
        pos: 1,
        raw: request_result['rgDescriptions']['231711804_253036912']
      }.stringify_keys

      expect(result).to eq [expected_item_hash]
    end
  end

  def load_fixture(fixture)
    JSON.parse(File.read(File.join(Rails.root, "/spec/fixtures/steam/#{fixture}.json")))
  end
end
