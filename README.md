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

development:
  adapter: sqlite3
  database: db/development.db

test:
  adapter: sqlite3
  database: db/test.db
```

## run

```sh
ENV=development bundle exec rake db:migrate
ENV=development bundle exec ruby app.rb -o 0.0.0.0 &
```

## How to Use

### Get Topis

```sh
$ curl -s http://localhost:4567/topics | jq .
[
  {
    "id": 2,
    "title": "hoge",
    "description": "aaaaaaaaaaaaaaaaaaaa",
    "created_at": "2018-02-09T11:08:02.000Z",
    "updated_at": "2018-02-09T13:07:38.000Z"
  },
  {
    "id": 1,
    "title": "huga",
    "description": "aaaaaaaaaaaaaaaaaaaa",
    "created_at": "2018-02-09T11:00:33.000Z",
    "updated_at": "2018-02-09T13:02:52.000Z"
  }
]

$ curl -s http://localhost:4567/topic/1 | jq .
{
  "id": 1,
  "title": "mori",
  "description": "aaaaaaaaaaaaaaaaaaaa",
  "created_at": "2018-02-09T11:00:33.000Z",
  "updated_at": "2018-02-09T13:02:52.000Z"
}
```

### Create Topic

```sh
$ curl -X POST http://localhost:4567/topic -d '{"title": "foo", "description": "bar"}'
```

### Update Topic

```sh
$ curl -I -X PUT http://localhost:4567/topic/2 -d '{"title": "foo", "description": "baaaaaaaaaaaaaaaaaaaa"}'
```

### Delete Topic

```sh
$ curl -X DELETE http://localhost:4567/topic/2
```

## How to Test

### run

```sh
ENV=development bundle exec rake db:migrate
ENV=test bundle exec rake test
```

## reference

- [https://qiita.com/litmon/items/63231bbf2a43a4dc895f](https://qiita.com/litmon/items/63231bbf2a43a4dc895f)
- [https://qiita.com/u1_fukui/items/88c10d4d530ec6fbaaa1](https://qiita.com/u1_fukui/items/88c10d4d530ec6fbaaa1)
- [https://qiita.com/yaaamaaaguuu/items/6c7e689fbc339a99fc62](https://qiita.com/yaaamaaaguuu/items/6c7e689fbc339a99fc62)
- [https://towardsdatascience.com/how-i-test-ruby-apis-in-a-non-rails-environment-718aba24b189](https://towardsdatascience.com/how-i-test-ruby-apis-in-a-non-rails-environment-718aba24b189)
- [http://recipes.sinatrarb.com/p/testing/minitest](http://recipes.sinatrarb.com/p/testing/minitest)
- [https://stackoverflow.com/questions/33489691/sinatra-and-activerecord-no-rails-creating-test-database](https://stackoverflow.com/questions/33489691/sinatra-and-activerecord-no-rails-creating-test-database)


