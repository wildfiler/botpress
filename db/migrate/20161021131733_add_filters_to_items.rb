class AddFiltersToItems < ActiveRecord::Migration[5.0]
  def change
    create_table :filter_types do |t|
      t.string :name, null: false
      t.belongs_to :game, index: true, null: false
      t.timestamps null: false
    end

    create_table :filter_values do |t|
      t.string :value, null: false
      t.belongs_to :filter_type, index: true, null: false
      t.timestamps null: false
    end

    create_table :item_filter_values do |t|
      t.belongs_to :item, index: true, null: false
      t.belongs_to :filter_value, index: true, null: false
      t.timestamps null: false
    end
  end
end
