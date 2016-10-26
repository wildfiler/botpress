require 'rails_helper'

describe 'user visit users admin page' do
  it 'sees list of all users' do
    admin_user = create(:user, :admin)
    users = create_list(:user, 2)

    visit admin_users_path(as: admin_user)

    expect(page).to have_link(admin_user.email, href: admin_user_path(admin_user))
    users.each do |user|
      expect(page).to have_link(user.email, href: admin_user_path(user))
    end
  end
end
