require 'rails_helper'

describe 'admin visit admin/filter_type#edit page' do
  it 'can edit filter type' do
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

  context 'filter values' do
    it 'can edit filter values' do
      filter_type = create(:filter_type)
      _filter_value = create(:filter_value, filter_type: filter_type)
      new_filter_value_name = 'Some very cool filter'

      visit edit_admin_filter_type_path(filter_type, as: create(:user, :admin))
      fill_in 'Value', with: new_filter_value_name
      click_on 'Update Filter type'

      expect(page).to have_content(new_filter_value_name)
    end

    it 'can add and delete filter values', js: true do
      filter_type = create(:filter_type)
      deleting_filter_value = create(:filter_value, filter_type: filter_type)
      new_filter_value_name = 'awsome new filter'

      visit edit_admin_filter_type_path(filter_type, as: create(:user, :admin))
      first('.filter_value_field').click_on('Remove')
      click_on('Add Filter value')
      fill_in 'Value', with: new_filter_value_name
      click_on 'Update Filter type'

      expect(page).to have_content(new_filter_value_name)
      expect(page).not_to have_content(deleting_filter_value.value)
    end
  end
end
