class AddCounterCacheToFilterValue < ActiveRecord::Migration[5.0]
  def change
    add_column :filter_values, :items_count, :integer, default: 0, null: false
  end
end
