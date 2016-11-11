class Game < ApplicationRecord
  has_many :items
  has_many :filter_types

  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :published, -> { where(published: true) }
  scope :ordered, -> { order(name: :asc) }
end
