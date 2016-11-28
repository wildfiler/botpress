class CreateImportStatusesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :import_statuses do |t|
      t.string :status, null: false
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.belongs_to :bot, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
