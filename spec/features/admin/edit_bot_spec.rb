require 'rails_helper'

describe 'admin visit bot edit page' do
  it 'can edit bot data' do
    admin = create(:user, :admin)
    old_bot_account = create(:account)
    _old_bot_user = create(:user, account: old_bot_account)
    new_bot_account = create(:account)
    _new_bot_user = create(:user, account: new_bot_account)
    bot = create(:bot, account: old_bot_account)
    new_bot_name = 'renamed bot'
    new_bot_steam_id = '2131245344'

    visit edit_admin_bot_path(bot, as: admin)
    fill_in('Bot name', with: new_bot_name)
    fill_in('Bot Steam ID', with: new_bot_steam_id)
    select(new_bot_account.name)
    click_on('Update Bot')

    expect(page).to have_content(new_bot_name)
    expect(page).to have_link(new_bot_account.id)
    expect(page).to have_content(new_bot_steam_id)
  end
end
