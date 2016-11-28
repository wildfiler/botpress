require 'rails_helper'

describe Bot do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:steam_id) }
    it { is_expected.to validate_presence_of(:account_id) }
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'assocoations' do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to have_many(:items) }
    it { is_expected.to have_many(:import_statuses) }
  end

  describe 'slugs' do
    it 'has unique slug' do
      name = 'Dota 2'
      bots = create_list(:bot, 3, name: name)

      bots.drop(1).each_with_index do |bot, i|
        expect(bot.slug).to eq("#{name.parameterize}-#{i + 2}")
      end
    end
  end
end
