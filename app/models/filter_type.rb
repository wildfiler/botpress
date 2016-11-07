class FilterType < ApplicationRecord
  belongs_to :game
  has_many :filter_values, dependent: :destroy, inverse_of: :filter_type
  validates :name, :game_id, presence: true

  accepts_nested_attributes_for :filter_values,
                                reject_if: proc { |a| a[:value].blank? },
                                allow_destroy: true

  def items_count
    filter_values.sum(&:items_count)
  end
end
