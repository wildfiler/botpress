require 'rails_helper'

describe FilterValue do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:filter_type) }
  end

  describe 'assocoations' do
    it { is_expected.to have_many(:items).through(:item_filter_values) }
    it { is_expected.to have_many(:item_filter_values) }
    it { is_expected.to belong_to(:filter_type) }
  end
end
