# Sinatra Sample Application

## reference

- [https://qiita.com/u1_fukui/items/88c10d4d530ec6fbaaa1](https://qiita.com/u1_fukui/items/88c10d4d530ec6fbaaa1)

## database.yml

```yaml
development:
  adapter: mysql2
  database: myapp
  host: your_host
  username: your_username
  password: your_password
  encoding: utf8
```

## run

```sh
bundle exec ruby app.rb -o 0.0.0.0 &
```
