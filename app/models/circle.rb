class Circle < ApplicationRecord
  validates :circle_name, presence: true

  has_many :circle_users
  has_many :users, through: :circle_users
  has_many :virtual_contests
end