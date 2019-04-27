class Circle < ApplicationRecord
  validates :circle_name, presence: true

  has_many :circle_users, foreign_key: :circle_name
  has_many :users, through: :circle_users
end