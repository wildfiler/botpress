require 'rails_helper'

describe Bot do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:steam_id) }
    it { is_expected.to validate_presence_of(:account_id) }
  end

  describe 'assocoations' do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to have_many(:items) }
  end
end
