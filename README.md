# README

migrationにはridgepoleを使っています

```
bundle exec ridgepole -c config/database.yml -E development --apply -f Schemafile.rb --allow-pk-change
```

データは以下の順でコマンドを叩いて入れます

```
bundle exec rake user:update[1]
bundle exec rails db:seed
bundle exec rake contest:update
bundle exec rake standing:create[コンテストid]
```