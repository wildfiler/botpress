class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end
