class Item < ApplicationRecord
  belongs_to :game
  belongs_to :bot

  validates :bot_id, :game_id, presence: true
end
