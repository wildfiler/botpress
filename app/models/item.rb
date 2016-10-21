class Item < ApplicationRecord
  IMAGE_URL = 'https://steamcommunity-a.akamaihd.net/economy/image/'.freeze

  belongs_to :game, counter_cache: true
  belongs_to :bot
  has_many :filter_values, through: :item_filter_values
  has_many :item_filter_values

  validates :bot_id, :game_id, presence: true

  serialize :raw, JSON

  scope :last_ten, -> { order(created_at: :desc).first(10) }

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end

  def icon_thumb_url
    "#{icon_large_url}/62fx62f"
  end

  def icon_url
    "#{IMAGE_URL}#{super}/360fx360f"
  end

  def icon_large_url
    "#{IMAGE_URL}#{super}"
  end

  def name_color
    raw['name_color']
  end
end
