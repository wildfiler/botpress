class Account < ApplicationRecord
  has_many :users
  has_many :bots

  def first_user
    users.first
  end

  def name
    first_user.email.split('@').first + id.to_s
  end
end
