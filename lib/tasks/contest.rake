namespace :contest do
  task update: :environment do
    contests = JSON.parse(open('https://kenkoooo.com/atcoder/resources/contests.json').read)
    contests.each do |contest|
      Contest.find_or_create_by(contest.slice('id', 'title', 'start_epoch_second'))
    end
  end
end
