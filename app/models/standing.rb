class Standing < ApplicationRecord
  validates :rank, presence: true

  belongs_to :contest
  belongs_to :user, foreign_key: :user_name, primary_key: :user_name, optional: true
  has_many :submissions
end
