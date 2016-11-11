require 'rails_helper'

describe 'user visit account page' do
  it 'can add bot to it' do
    account = create :account
    user = create :user, account: account
    steam_bot_id = '123'
    steam_bot_name = 'Awsome bot'

    visit profile_account_path(as: user)

    click_on 'Add bot to account'
    fill_in 'Bot Steam ID', with: steam_bot_id
    fill_in 'Bot name', with: steam_bot_name
    click_on 'Add'

    expect(page).to have_current_path(profile_account_path)
    expect(page).to have_content(steam_bot_name)
  end
end
