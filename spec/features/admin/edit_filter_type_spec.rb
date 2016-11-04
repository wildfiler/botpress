require 'rails_helper'

describe 'admin visit admin/filter_type#edit page' do
  it 'can create new filter type' do
    old_game = create(:game)
    new_game = create(:game)
    filter_type = create(:filter_type, game: old_game)
    new_filter_type_name = 'very new filter_type name'

    visit edit_admin_filter_type_path(filter_type, as: create(:user, :admin))
 
    fill_in('Name', with: new_filter_type_name)
    select(new_game.name)
    click_on 'Update Filter type'

    expect(page).to have_css('.filter_type_name', text: new_filter_type_name)
    expect(page).to have_content(new_game.name)
  end
end
