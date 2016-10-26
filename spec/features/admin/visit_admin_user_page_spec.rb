require 'rails_helper'

describe 'user visit user page' do
  it 'sees user info' do
    admin_user = create(:user, :admin)
    account = create(:account)
    user = create(:user, account: account)

    visit admin_user_path(user, as: admin_user)

    expect(page).to have_content(user.email)
    expect(page).to have_link(user.account.id)
  end
end
