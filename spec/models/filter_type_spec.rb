
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

  describe 'nested atrributes' do
    it do
      is_expected.to accept_nested_attributes_for(:filter_values).
        allow_destroy(true)
    end

    it 'creates filter_values'do
      expect do
        create(:filter_type,
                filter_values_attributes: [attributes_for(:filter_value)])
      end.to change(FilterValue, :count).by(1)
    end

    it "won't create filter_value if field is blank"do
      expect do
        create(:filter_type,
                filter_values_attributes: [attributes_for(:filter_value, value: '')])
      end.not_to change(FilterValue, :count)
    end
  end
end
