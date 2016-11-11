require 'rails_helper'

describe ItemsController do
  it "find item by it's name" do
    item = create(:item)

    get :show, params: { game_id: item.game.id, id: item.name }

    expect(response).to have_http_status(:success)
  end
end
