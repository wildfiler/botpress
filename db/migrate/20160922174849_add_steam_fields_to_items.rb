class AddSteamFieldsToItems < ActiveRecord::Migration[5.0]
  def change
    change_table :items do |t|
      t.string :steam_id
      t.string :classid
      t.string :instanceid
      t.string :amount
    end
  end
end
