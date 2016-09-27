class Item < ApplicationRecord
  IMAGE_URL = 'https://steamcommunity-a.akamaihd.net/economy/image/'.freeze

  belongs_to :game, counter_cache: true
  belongs_to :bot

  validates :bot_id, :game_id, presence: true

  serialize :raw, JSON

  scope :last_ten, -> { order(created_at: :desc).first(10) }

  def icon_url
    "#{IMAGE_URL}#{raw['icon_url']}"
  end

  def icon_large_url
    "#{IMAGE_URL}#{raw['icon_url_large']}"
  end

  def name_color
    raw['name_color']
  end
end
