# README

bundle exec rails db:create
bundle exec ridgepole -c config/database.yml -E development --apply -f Schemafile.rb --allow-pk-change
bundle exec rake user:update