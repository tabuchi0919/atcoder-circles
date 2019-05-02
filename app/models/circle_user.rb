class CircleUser < ApplicationRecord
  validates :circle_id, presence: true
  validates :user_id, presence: true

  belongs_to :circle
  belongs_to :user
end
