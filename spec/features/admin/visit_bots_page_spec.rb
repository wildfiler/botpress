require 'rails_helper'

describe 'admin visit bots page' do
  it 'sees list of all bots' do
    admin = create(:user, :admin)
    bots = create_list(:bot, 3)

    visit admin_bots_path(as: admin)

    bots.each do |bot|
      expect(page).to have_link(bot.name)
    end
  end
end
