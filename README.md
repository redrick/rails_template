# Dockerized rails 5.1 boilerplate for simple projects

## Renaming to your app

I ussually use [rename](https://github.com/morshedalam/rename) to just rename the whole app to something more suitable

Then there are few areas where you should not forget to do it yourself:

* .env contains DB name which should be app specific
* database.yml defaults to rails_template values
* Dockerfile-dev contains APP_HOME
* docker-compose.yml contains it in more places (look for `rails-template-sync` and `rails_template`)
* docker-sync.yml also has `rails-template-sync` name in it

## Setup

### Docker

Tested on MacOS

Try out docker-sync so it install all required dependencies and downloads all images correctly:

```
docker-sync-stack start
```

Will seem like your app is started, but that is not all, you will get all kinds
of mistakes about DB, so you need to create and load DB structure:

```
docker-compose -f docker-compose.yml run bundle exec rails db:create db:structure:load
```

Now it will start correctly and you are able to load it too.
First load is insanely slow, but from then on it will run smoothly for you.

#### More commands

Anytime, you can call all rails/rake tasks you are used to with prepending this
to it:

```
docker-compose -f docker-compose.yml run web bundle exec ...
```

so e.x. running testsuite looks like this:

```
docker-compose -f docker-compose.yml run web bundle exec rspec
```
