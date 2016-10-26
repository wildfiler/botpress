require 'rails_helper'

describe 'admin visit accounts page' do
  it 'sees list of all accounts' do
    accounts = create_list(:account, 3)

    visit admin_accounts_path(as: create(:user, :admin))

    accounts.each do |account|
      expect(page).to have_link(account.id, href: admin_account_path(account))
    end
  end
end
