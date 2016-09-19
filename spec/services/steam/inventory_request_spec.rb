require 'rails_helper'

describe Steam::InventoryRequest, :focus do
  it 'makes request to steam' do
    http_client = create_http_client
    fetcher = Steam::InventoryRequest.new(client: http_client)

    fetcher.get('ID', 'APP_ID', 'APP_CONTEXT')

    expect(http_client).to have_received(:get).
      with('http://steamcommunity.com/profiles/ID/inventory/json/APP_ID/APP_CONTEXT')
  end

  it 'returns response from steam' do
    response = double(:response)
    http_client = create_http_client(response: response)
    fetcher = Steam::InventoryRequest.new(client: http_client)

    result = fetcher.get('ID', 'APP_ID', 'APP_CONTEXT')

    expect(result).to eq(response)
  end

  it 'raises error if server respond with non 200' do
    http_client = create_http_client(code: 500)

    fetcher = Steam::InventoryRequest.new(client: http_client)

    expect do
      fetcher.get('ID', 'APP_ID', 'APP_CONTEXT')
    end.to raise_error(Steam::InventoryRequest::WrongResponse)
  end

  def create_http_client(response: nil, code: 200)
    double(:http_client).tap do |http_client|
      http_response = double(:http_response, code: code, parsed_response: response)
      allow(http_client).to receive(:get).and_return(http_response)
    end
  end
end
