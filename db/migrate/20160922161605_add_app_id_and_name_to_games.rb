class AddAppIdAndNameToGames < ActiveRecord::Migration[5.0]
  def change
    change_table :games do |t|
      t.integer :app_id, null: false
      t.string :name, null: false
      t.boolean :published, default: false, null: false
    end
  end
end
