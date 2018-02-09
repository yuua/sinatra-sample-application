# Sinatra Sample Application

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
