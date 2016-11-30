require 'rails_helper'

describe 'admin visit user profile can edit profile' do
  it "can change user's email" do
    admin_user = create(:user, :admin)
    user = create(:user)
    new_email = 'new@example.com'

    visit edit_admin_user_path(user, as: admin_user)
    fill_in('Email', with: new_email)
    click_on('Edit User')
    expect(page).to have_content(new_email)
  end

  it 'can change user password' do
    admin_user = create(:user, :admin)
    user = create(:user)
    new_password = 'new_secret_password'

    visit edit_admin_user_path(user, as: admin_user)
    fill_in('Password', with: new_password)
    fill_in('Password confirmation', with: new_password)
    click_on('Edit User')
    click_on('Sign out')

    visit sign_in_path
    fill_in('Email', with: user.email)
    fill_in('Password', with: new_password)
    click_button('Sign in')

    expect(page).to have_content('Sign out')
  end

  it 'can set user role as admin' do
    admin_user = create(:user, :admin)
    user = create(:user)
    visit edit_admin_user_path(user, as: admin_user)
    check('Promote to admin')
    click_on('Edit User')
    user.reload

    expect(user.admin).to eq(true)
  end
end
