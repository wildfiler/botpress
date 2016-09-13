require 'rails_helper'

describe Item do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:game_id) }
    it { is_expected.to validate_presence_of(:bot_id) }
  end

  describe 'assocoations' do
    it { is_expected.to belong_to(:game) }
    it { is_expected.to belong_to(:bot) }
  end
end
