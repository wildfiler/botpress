class CreateBaseTables < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.timestamps null: false
    end

    create_table :games do |t|
      t.timestamps null: false
    end

    create_table :users do |t|
      t.string :email, null: false
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end

    create_table :bots do |t|
      t.string :steam_id, null: false
      t.references :account, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end

    create_table :items do |t|
      t.text :raw
      t.references :bot, index: true, foreign_key: true, null: false
      t.references :game, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
