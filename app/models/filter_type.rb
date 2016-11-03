class FilterType < ApplicationRecord
  belongs_to :game
  has_many :filter_values
  validates :name, :game_id, presence: true

  accepts_nested_attributes_for :filter_values,
                                reject_if: proc { |a| a[:filter_type_id].blank? },
                                allow_destroy: true

  def items_count
    filter_values.sum(&:items_count)
  end
end
