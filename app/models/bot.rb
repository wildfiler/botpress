class Bot < ApplicationRecord
  has_many :items
  belongs_to :account

  validates :steam_id, :account_id, :name, presence: true

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [:name] + Array.new(6) { |index| [:name, index + 2] }
  end
end
