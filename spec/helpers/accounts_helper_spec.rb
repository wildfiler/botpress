require 'rails_helper'

describe AccountsHelper do
  describe '#options_for_account' do
    it 'returns list of all accounts first email users and account_id' do
      account1 = create(:account)
      account2 = create(:account)
      _user1 = create(:user, account: account1)
      _user2 = create(:user, account: account2)

      expect(helper.options_for_account).to match_array(
        [[account1.name, account1.id], [account2.name, account2.id]]
      )
    end
  end
end
