class FilterValue < ApplicationRecord
  has_many :items, through: :item_filter_values
  has_many :filter_types
  has_many :item_filter_values

  belongs_to :filter_type

  validates :value, :filter_type, presence: true
end
