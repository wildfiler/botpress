class AddSlugToModels < ActiveRecord::Migration[5.0]
  def change
    change_table :games do |t|
      t.string :slug, null: false
      t.index :slug
    end
    change_table :bots do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.index :slug
    end
  end
end
