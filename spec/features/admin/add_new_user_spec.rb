require 'rails_helper'

describe 'admin visit admin new user page' do
  it 'can add new user' do
    admin = create(:user, :admin)
    user_email = 'example@foo.bar'
    user_password = '12345678'

    visit new_admin_user_path(as: admin)
    fill_in('Email', with: user_email)
    fill_in('Password', with: user_password)
    fill_in 'Password confirmation', with: user_password
    check('Promote to admin')
    click_on('Create User')

    expect(page).to have_content(user_email)
  end

  it "can't create user with wrong password confirmation" do
    admin = create(:user, :admin)
    user_email = 'example@foo.bar'
    user_password = '12345678'
    wrong_password = '87654321'

    visit new_admin_user_path(as: admin)
    fill_in('Email', with: user_email)
    fill_in('Password', with: user_password)
    fill_in 'Password confirmation', with: wrong_password
    check('Promote to admin')
    click_on('Create User')

    expect(page).not_to have_content(user_email)
  end
end
