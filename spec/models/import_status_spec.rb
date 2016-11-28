require 'rails_helper'

describe ImportStatus do
  context 'validations' do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:bot_id) }
  end

  context 'assosiations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:bot) }
  end
end
