class Circle < ApplicationRecord
  has_secure_password

  validates :circle_name, presence: true, uniqueness: true

  has_many :circle_users
  has_many :users, through: :circle_users
  has_many :virtual_contests

  def to_param
    circle_name
  end
end