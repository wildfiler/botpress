require 'rails_helper'

describe 'admin visit filter_types page' do
  it 'sees list of of all filter types' do
    filter_types = create_list(:filter_type, 3)
    visit admin_filter_types_path(as: create(:user, :admin))

    filter_types.each do |filter_type|
      expect(page).to have_content(filter_type.name)
    end
  end

  it 'sees total items that use this filter_type' do
    filter_type = create(:filter_type)
    filter_value1 = create(:filter_value, filter_type: filter_type)
    filter_value2 = create(:filter_value, filter_type: filter_type)

    create_list(:item, 2, filter_values: [filter_value1])
    create(:item, filter_values: [filter_value2])
    visit admin_filter_types_path(as: create(:user, :admin))

    expect(page).to have_css('.filter_type', text: '3')
  end
end
