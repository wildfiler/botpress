class User < ApplicationRecord
  include Clearance::User

  belongs_to :account, optional: true

  validates :email, presence: true
  validates_confirmation_of :password

  attr_accessor :password_confirmation
end
