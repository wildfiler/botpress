require 'rails_helper'

describe 'admin visit filter type page' do
  it 'can see filter type info' do
    filter_type = create(:filter_type)
    filter_values = create_list(:filter_value, 2, filter_type: filter_type)
    create_list(:item, 2, filter_values: filter_values)

    visit admin_filter_type_path(filter_type, as: create(:user, :admin))

    expect(page).to have_content(filter_type.name)
    expect(page).to have_content(filter_type.game.name)
    filter_values.each do |filter_value|
      expect(page).to have_content(filter_value.value)
      expect(page).to have_css('.filter_value', text: filter_value.items.count)
    end
  end
end
