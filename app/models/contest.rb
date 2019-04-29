class Contest < ApplicationRecord
  validates :title, presence: true
  validates :id, presence: true

  has_many :tasks
  has_many :standings
end
