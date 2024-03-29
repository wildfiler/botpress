require 'rails_helper'

describe User do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'assocoations' do
    it { is_expected.to belong_to(:account) }
  end
end
