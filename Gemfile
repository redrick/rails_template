source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Auth
gem 'devise'

# env variables setup
gem 'dotenv-rails', '~> 2.1'

# KEEP RAILS UP TO DATE!
gem 'rails', '~> 5.2'

# PostgreSQL ruby wrapper
gem 'pg', '< 1'

# timezone info
gem 'tzinfo-data'

# webserver
gem 'puma', '~> 3.7'

# assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# frontend framworks etc...
gem 'webpacker'

# JSON API
gem 'jbuilder', '~> 2.5'

# pagination
gem 'will_paginate'

# mainly db rake task for ssh to deployed server
gem 'net-ssh'

# i18n
gem 'globalize', github: 'globalize/globalize'
gem 'i18n'

# Model versioning
gem 'paper_trail'

# Redis - cache, session, sidekiq...
gem 'redis-namespace'
gem 'redis-rails'

# ActiveJob
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'sinatra', require: nil

group :development, :test do
  gem 'overcommit', require: false
  gem 'poltergeist'
  gem 'pry'
  gem 'pry-byebug', require: false
  gem 'pry-rails', require: false
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubycritic', require: false
end

group :development do
  gem 'bundler-audit'
  # docker sync files with container
  gem 'docker-sync'
  # run procfile tasks
  gem 'foreman'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails_best_practices'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'vcr'
  gem 'webmock'
end
