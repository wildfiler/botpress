class FilterType < ApplicationRecord
  belongs_to :game
  has_many :filter_values
  validates :name, :game_id, presence: true
end
