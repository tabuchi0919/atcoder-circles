class User < ApplicationRecord
  validates :user_name, presence: true, uniqueness: true
  validates :rating, presence: true
  validates :highest, presence: true

  has_many :circle_users
  has_many :circles, through: :circle_users
end