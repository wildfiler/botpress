class FilterType < ApplicationRecord
  belongs_to :game
  has_many :filter_values
  validates :name, :game_id, presence: true

  def items_count
    filter_values.sum(&:items_count)
  end
end
