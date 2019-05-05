# frozen_string_literal: true

namespace :user do
  task :update, [:page_number] => :environment do |_t, args|
    (args[:page_number]..).each do |i|
      html = open("https://atcoder.jp/ranking?page=#{i}").read
      doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
      (1..100).each do |j|
        row = "#main-container > div.row > div > div.panel.panel-default.panel-filter > div.table-responsive > table > tbody > tr:nth-child(#{j})"
        name = doc.css("#{row} > td:nth-child(2) > a.username > span").text
        exit if name.empty?
        user = User.find_or_initialize_by(user_name: name)
        user.rating = doc.css("#{row} > td:nth-child(4) > b").text
        user.highest = doc.css("#{row} > td:nth-child(5) > b").text
        user.save!
      end
      sleep(5)
    end
  end
end
