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

  it 'retry get inventory if wrong response is recieved' do
    request = instance_double(Steam::InventoryRequest)
    allow(request).to receive(:get) { raise Steam::InventoryRequest::WrongResponse }
    fetcher = Steam::Fetcher.new(request: request)

    expect do
      fetcher.get('steam_id', 'app_id')
    end.not_to raise_error
  end

  it 'retry 10 times get inventory if too many requests are made' do
    request = instance_double(Steam::InventoryRequest)
    allow(request).to receive(:get) { raise Steam::TooManyRequests }
    expect(request).to receive(:get).exactly(12).times
    fetcher = Steam::Fetcher.new(request: request)

    allow(fetcher).to receive(:sleep).with(5)
    expect(fetcher).to receive(:sleep).with(5).at_least(11).times

    expect do
      fetcher.get('steam_id', 'app_id')
    end.not_to raise_error
  end

  def load_fixture(fixture)
    JSON.parse(File.read(File.join(Rails.root, "/spec/fixtures/steam/#{fixture}.json")))
  end
end
