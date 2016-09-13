require 'rails_helper'

describe Game do
  describe 'assocoations' do
    it { is_expected.to have_many(:items) }
  end
end
