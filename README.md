# README

migrationにはridgepoleを使っています。

```
bundle exec ridgepole -c config/database.yml -E development --apply -f Schemafile.rb --allow-pk-change
```

データは以下の順でコマンドを叩いて入れます。

```
bundle exec rake user:update[1]
bundle exec rails db:seed
bundle exec rake contest:update
bundle exec rake standing:create[コンテストid]
```

デプロイの際は、

```
git pull
bundle exec pumactl -P tmp/pids/server.pid restart
(bundle exec rails s -e production -d)
sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000
```

とします。