class User < ApplicationRecord
  include Clearance::User

  has_many :import_statuses

  belongs_to :account, optional: true

  validates :email, presence: true
end
