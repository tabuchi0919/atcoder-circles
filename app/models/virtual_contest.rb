class VirtualContest < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true
  validate :valid_url?
  belongs_to :circle

  def valid_url?
    host = URI.parse(url).host
    return if [
      'kenkoooo.com',
      'not-522.appspot.com',
      'onlinejudge.u-aizu.ac.jp',
      'codeforces.com'
    ].include?(host)

    errors.add(url: :invalid)
  rescue URI::InvalidURIError
    errors.add(url: :invalid)
  end

end


