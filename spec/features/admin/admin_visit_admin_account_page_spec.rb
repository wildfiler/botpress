require 'rails_helper'

describe 'admin visit account page' do
  it 'sees account info' do
    account = create(:account)
    bots = create_list(:bot, 2, account: account)
    users = create_list(:user, 2, account: account)

    visit admin_account_path(account, as: create(:user, :admin))

    expect(page).to have_content(account.id)

    bots.each do |bot|
      expect(page).to have_link(bot.name)
    end

    users.each do |user|
      expect(page).to have_link(user.email)
    end
  end
end
