# Dockerized Ruby on Rails 5.1 boilerplate

This is basically something like a base for my projects... a boilerplate if you will...
First project I did with it was a no brainer, so there is loads missing I use on bigger projects,
but since my previous unpublished one is out of date (rails 4.2) I will have to implement
all that stuff in here (see TODOs down)

Demo could be seen here:

* Frontend - [https://rails-template.railscode.eu/](https://rails-template.railscode.eu/)
* Admin - [https://rails-template.railscode.eu/admin](https://rails-template.railscode.eu/admin)
* Admin login:
  * email: `hello@world.com`
  * pwd: `whateverdude`

## What this provides?

It provides couple things, but first and foremost it is:
* Rails 5.1 boilerplate
* webpacker and yarn are used (hopefully I move completely away from assets
  pipeline which is still left there hanging)
* Tests are configured and using Rspec, Capybara + poltergeist, VCR and couple
  more usefull configs
* Using PostgreSQL
* dotenv
* Devise (and admin_user)
* [AdminLTE](https://adminlte.io/themes/AdminLTE/) for `/admin/...`
  * accessible on /admin/home
  * create your user in rails console: `> AdminUser.create(email: 'hello@world.com', password: 'whateverdude')`
* Couple things watching your every step...
  * Rubocop
  * rubycritic (in wercker example config)
  * rails_best_practices
  * overcommit (running couple more precommit hooks...)
  * Brakeman (in wercker example config)
  * bundle-audit (in wercker example config)
* [Wercker](http://www.wercker.com/) as free CI for private github repos - default .yml config
* Docker fully configured to be used for development (Win users in the team)

I highly recommend using [dokku](https://github.com/dokku/dokku) even for
production envs. which really takes pressure off you as developer, but I get
the idea of how hard it may be to have your own PaaS and install and update
server, why not just use heroku for that purpose right? So here is a button:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

There are couple more things prepared for usage, which you can simply discover by running through `Gemfile`
and also `config` directory

Will be adding more as time goes and different projects get finished

### Rake tasks

#### DB

This template also provides you with usefull DB rake tasks, but if and only if
you use dokku as mentioned before for deployment here...

all you need is SSH key added as root user on server where your dokku runs
(which you probably have anyway...)

And know your server IP address and name of postgres container linked to your
dokku instance... You just fill those out in `.env` as `REMOTE..` keys
respectively... then you are all set for these things:

Backing up your given remote DB to your local machine with:

```
rails db:backup
```

And the script will tell you where it saves the `.sql` human readable dump of DB.

Then you can run import of that backup to local DB if properly configured (`.env` again):

```
bin/rails db:environment:set RAILS_ENV=development db:import_backup
```

Standard disclaimer here, as this task drops and recreates your DB please set
env variable as given, this script is not intended to be used outside importing
development DB!

And also provides a task that does both in one go:

```
bin/rails db:environment:set RAILS_ENV=development db:backup_and_import
```

## Renaming to your app

I ussually use [rename](https://github.com/morshedalam/rename) to just rename the whole app to something more suitable

Then there are few areas where you should not forget to do it yourself:

* .env contains DB name which should be app specific
* database.yml defaults to rails_template values
* Dockerfile-dev contains APP_HOME
* docker-compose.yml contains it in more places (look for `rails-template-sync` and `rails_template`)
* docker-sync.yml also has `rails-template-sync` name in it

## Setup

To setup a basic project there is not much to do....

Clone this repo:

```
$ git clone git@github.com:redrick/rails_template.git
```

Enter the directory with project, and run bundle:

```
$ cd rails_template
$ bundle
```

Then you are ready to run both webpack and rails server and enjoy the app:

```
rails start
```

This one is basically just a rake task that starts  `webpack-dev-server` and `rails s` on your machine.
Your app is now running on port `5000` which you can change whenever you
want...

### Docker

Tested on MacOS (well not really with webpacker, but previously this was
flawless the way it is... I just transfered over configs and stuff...)

Try out docker-sync so it install all required dependencies and downloads all images correctly:

```
docker-sync-stack start
```

Will seem like your app is started, but that is not all, you will get all kinds
of mistakes about DB, so you need to create and load DB structure:

```
docker-compose -f docker-compose.yml run bundle web exec rails db:create db:structure:load
```

You will also need to install yarn packages since `/node_modules` is taken out of sync list for docker by running:

```
docker-compose -f docker-compose.yml run web yarn install
```

Now it will start correctly and you are able to load it too.
First load is insanely slow, but from then on it will run smoothly for you.

#### DISCLAIMER

Docker uses `.env` file to read defaults on startup and defined `env_file` for
runtime substitutions... therefore the contents on `.env` in example look like
that ;)

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

# TODOs

There are many more things missing:

* Discover and use more of adminLTE cool stuff
* Yarn packages (ton of then either missing or not working...)
* Translations... hardcoded stuff all over the place...
* And much more I will discover...

# Contributing

You probably know anyway right?

Write me in the issues, I will gladly help with any of them :)

Or just fork and create PR, that woul be very much appreciated :)
