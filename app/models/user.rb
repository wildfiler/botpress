class User < ApplicationRecord
  include Clearance::User

  belongs_to :account, optional: true

  validates :email, presence: true
  validates :password, confirmation: true

  attr_accessor :password_confirmation
end
