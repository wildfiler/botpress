require 'rails_helper'

describe Profile::AccountsController do
  context 'user has no account' do
    it 'have succses status' do
      user = create(:user)
      sign_in_as(user)

      get :show

      expect(response).to have_http_status(:success)
    end

    it "don't create new account record" do
      user = create(:user)
      sign_in_as(user)

      expect { get :show }.to_not change(Account, :count)
    end
  end

  context 'user not logged in' do
    it "redirect's to login page" do
      sign_in_as(nil)
      get :show
      expect(response).to redirect_to('/sign_in')
    end
  end
end
