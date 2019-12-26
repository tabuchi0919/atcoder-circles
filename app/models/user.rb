class User < ApplicationRecord
  validates :user_name, presence: true, uniqueness: true

  has_many :circle_users
  has_many :circles, through: :circle_users
end
