class Item < ApplicationRecord
  IMAGE_URL = 'https://steamcommunity-a.akamaihd.net/economy/image/'.freeze

  belongs_to :game
  belongs_to :bot

  validates :bot_id, :game_id, presence: true

  serialize :raw, JSON

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
