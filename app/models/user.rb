class User < ApplicationRecord
  include Clearance::User

  belongs_to :account, optional: true

  validates :email, presence: true
end
