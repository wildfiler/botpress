require 'rails_helper'

describe Game do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'assocoations' do
    it { is_expected.to have_many(:items) }
  end
end
