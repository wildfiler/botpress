require 'rails_helper'

describe 'user visit profile account page' do
  context 'user has account' do
    it 'sees list of bots that belong to this account' do
      account = create(:account)
      user = create(:user, account: account)
      bots = create_list(:bot, 2, account: account)

      visit profile_account_path(as: user)

      expect(page).to have_content(account.id)
      bots.each do |bot|
        expect(page).to have_content(bot.id)
      end
    end
  end
end
