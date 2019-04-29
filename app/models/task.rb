class Task < ApplicationRecord
  validates :heading, presence: true
  validates :url, presence: true

  belongs_to :contest
end
