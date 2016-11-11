require 'rails_helper'

describe Account do
  describe 'assocoations' do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:bots) }
  end
end
