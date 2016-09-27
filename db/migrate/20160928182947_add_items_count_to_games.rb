class AddItemsCountToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :items_count, :integer, default: 0, null: false
  end
end
