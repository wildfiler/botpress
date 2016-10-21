
require 'rails_helper'

describe FilterType do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:game_id) }
  end

  describe 'assocoations' do
    it { is_expected.to have_many(:filter_values) }
    it { is_expected.to belong_to(:game) }
  end
end
