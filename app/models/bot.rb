class Bot < ApplicationRecord
  has_many :items
  belongs_to :account

  validates :steam_id, :account_id, presence: true
end
