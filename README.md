## Link to heroku
Heroku [link](https://poker-project-test.herokuapp.com/)

## Prerequisites

The setups steps expect following tools installed on the system.

- GitHub
- Ruby [3.0.1](https://github.com/gidpoiiohika/new_task_project/blob/master/Gemfile#L4)
- Rails [7.0.3](https://github.com/gidpoiiohika/new_task_project/blob/master/Gemfile#L6)
- PostgreSQL 

## Install

### Clone the repository

```shell
git git@github.com:gidpoiiohika/poker_project.git
cd poker_project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.1`

If not, install the right ruby version using [RVM](https://rvm.io/rvm/install#installing-rvm) (it could take a while):

```shell
rvm install 3.0.1
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```
### Initialize the database
```shell
rails db:create db:migrate
rake import_event_and_player:create_event_and_playeras
```

- lib/tasks/import_event_and_player.rake [rake](https://github.com/gidpoiiohika/poker_project/blob/master/lib/tasks/import_event_and_player.rake#L1)

## Run rails server

```shell
bin/dev
```

Open [http://127.0.0.1:3000/](http://127.0.0.1:3000)

## Gems

- [gem 'rubocop-rails'](https://github.com/rubocop/rubocop-rails)
- [gem "google_drive"](https://github.com/gimite/google-drive-ruby)
- [gem "byebug"](https://github.com/deivid-rodriguez/byebug)
