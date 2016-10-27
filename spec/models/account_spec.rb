require 'rails_helper'

describe Account do
  describe 'assocoations' do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:bots) }
  end

  describe '#first_user' do
    it 'returns first user' do
      first_user, second_user = build_stubbed_list(:user, 2)
      account = build_stubbed(:account, users: [first_user, second_user])

      expect(account.first_user).to eq(first_user)
    end
  end
end
