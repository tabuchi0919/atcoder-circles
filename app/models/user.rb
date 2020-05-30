class User < ApplicationRecord
  validates :user_name, presence: true, uniqueness: true, format: {with: /\A[a-zA-z]\w{2,15}\z/}

  has_many :circle_users
  has_many :circles, through: :circle_users
end
