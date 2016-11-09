class ImportStatus < ApplicationRecord
  belongs_to :bot
  belongs_to :user

  validates :status, :user_id, :bot_id, presence: true
end
