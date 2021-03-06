require 'webmock/rspec'
require 'vcr'

WebMock.allow_net_connect!

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/vcr'
  c.before_record { |i| i.response.body.force_encoding 'UTF-8' }
  c.default_cassette_options = {
    record: :new_episodes,
    match_requests_on: %i[method uri]
  }
  c.before_record do |i|
    i.request.headers.clear
    save_headers = %w[Total Per-Page Link Content-Type]
    i.response.headers.select! { |key| save_headers.include? key }
  end
end

WebMock.disable_net_connect!(allow_localhost: true)
