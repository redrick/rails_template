require 'capybara/poltergeist'
Capybara.configure do |config|
  config.javascript_driver = :poltergeist
end

options = {
  js_errors: false,
  url_whitelist: ['127.0.0.1'],
  timeout: 1.minute
}

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options)
end
