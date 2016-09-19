class Game < ApplicationRecord
  has_many :items

  scope :published, -> { where(published: true) }
end
