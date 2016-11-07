require 'rails_helper'

describe 'admin visit admin/filter_type#new page' do
  it 'can create new filter type' do
    filter_name = 'New filter'
    selected_game = create(:game)
    filter_value_name = 'new filter value'
    create_list(:game, 2)

    visit new_admin_filter_type_path(as: create(:user, :admin))

    fill_in 'Name', with: filter_name
    select selected_game.name
    fill_in 'Value', with: filter_value_name
    click_on 'Create Filter type'

    expect(page).to have_css('.filter_type_name', text: filter_name)
    expect(page).to have_content(selected_game.name)
    expect(page).to have_content(filter_value_name)
  end

  it 'can can add filter_value field', js: true do
    admin = create(:user, :admin)

    visit new_admin_filter_type_path(as: admin)

    number_of_filter_values_fields = page.all('.filter_value_field').count

    click_on('Add Filter value')
    expect(page).to have_css('.filter_value_field',
                             count: number_of_filter_values_fields + 1)
  end

  it 'can remove filter_value field', js: true do
    admin = create(:user, :admin)
    visit new_admin_filter_type_path(as: admin)
    number_of_filter_values_fields = page.all('.filter_value_field').count

    first('.filter_value_field').click_on('Remove')

    expect(page).to have_css('.filter_value_field',
                             count: number_of_filter_values_fields - 1)
  end
end
