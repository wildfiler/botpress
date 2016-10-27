require 'rails_helper'

describe 'admin can create new bot' do
  it 'can create bot to account of user' do
    admin = create(:user, :admin)
    account = create(:account)
    user = create(:user, account: account)
    bot_name = 'new bot name'
    bot_steam_id = '12345678'

    visit new_admin_bot_path(as: admin)
    fill_in('Bot name', with: bot_name)
    fill_in('Bot Steam ID', with: bot_steam_id)
    select(account.name)
    click_on('Create Bot')

    expect(page).to have_content(bot_name)
    expect(page).to have_link(user.account.id)
  end
end
