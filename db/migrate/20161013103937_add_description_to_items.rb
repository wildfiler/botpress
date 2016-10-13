class AddDescriptionToItems < ActiveRecord::Migration[5.0]
  def change
    change_table :items do |t|
      t.string :name
      t.string :market_hash_name
      t.text :description
      t.string :icon_url
      t.string :icon_large_url
      t.string :type
      t.string :name_color
      t.string :background_color
    end
  end
end
