require 'rails_helper'

describe ItemFilterValue do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:item_id) }
    it { is_expected.to validate_presence_of(:filter_value_id) }
  end

  describe 'assocoations' do
    it { is_expected.to belong_to(:item) }
    it { is_expected.to belong_to(:filter_value) }
  end
end
