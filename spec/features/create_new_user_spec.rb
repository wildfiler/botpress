require 'rails_helper'

describe 'visit sign up page' do
  context 'with valid data' do
    it 'can create new user' do
      email = 'example@email.com'
      password = 'new_password'
      total_users = User.all.count

      visit sign_up_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      within '.new_user' do
        click_on 'Sign up'
      end

      expect(User.all.count).to eq(total_users + 1)
    end
  end

  context 'without password confirmation' do
    it "can't create new user" do
      email = 'example@email.com'
      password = 'new_password'
      wrong_confirm_password = 'very_new_password'
      total_users = User.all.count

      visit sign_up_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: wrong_confirm_password
      within '.new_user' do
        click_on 'Sign up'
      end
      expect(User.all.count).to eq(total_users)
    end
  end
end
