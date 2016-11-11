require 'rails_helper'

describe 'user visit profile page' do
  describe 'with valid data' do
    it 'can change his password' do
      old_password = '12345678'
      new_password = 'very_new_password'
      user = create :user, password: old_password

      visit profile_path(as: user)

      fill_in 'Old password', with: old_password
      fill_in 'Password', with: new_password
      click_on 'Change password'

      click_on 'Sign out'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: new_password

      click_button 'Sign in'
      expect(page).to have_content('Sign out')
    end
  end

  describe 'with wrong old password' do
    it 'cannot change password' do
      wrong_old_password = 'i_forgot_my_password'
      new_password = 'very_new_password'
      user = create :user, password: 'my_super_secret_password'
      encrypted_password = user.encrypted_password

      visit profile_path(as: user)
      fill_in 'Old password', with: wrong_old_password
      fill_in 'Password', with: new_password
      click_on 'Change password'

      user.reload
      expect(user.encrypted_password).to eq(encrypted_password)
    end
  end
end
