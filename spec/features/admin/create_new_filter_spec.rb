require 'rails_helper'

describe 'admin visit admin/filter_type#new page' do
  it 'can create new filter type' do
    filter_name = 'New filter'
    selected_game = create(:game)
    create_list(:game, 2)

    visit new_admin_filter_type_path(as: create(:user, :admin))

    fill_in 'Name', with: filter_name
    select selected_game.name
    click_on 'Create Filter type'

    expect(page).to have_css('.filter_type_name',filter_name)
    expect(page).to have_content(selected_game.name)
  end
end
