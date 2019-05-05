class VirtualContest < ApplicationRecord
  VALID_URL_REGEX = /\Ahttps:\/\/not-522.appspot\.com\/contest\/\d+\z/i

  validates :title, presence: true
  validates :url, presence: true, format: { with: VALID_URL_REGEX }

  belongs_to :circle
end
