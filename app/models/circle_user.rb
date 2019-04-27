class CircleUser < ApplicationRecord
  validates :circle_name, presence: true
  validates :user_name, presence: true
  
  belongs_to :circle, foreign_key: :circle_name
  belongs_to :user, foreign_key: :user_name
end