class VirtualContest < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true

  belongs_to :circle
end