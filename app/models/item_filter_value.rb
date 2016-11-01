class ItemFilterValue < ApplicationRecord
  belongs_to :item
  belongs_to :filter_value, counter_cache: :items_count

  validates :filter_value_id, :item_id, presence: true
end
