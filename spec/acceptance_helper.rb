require_relative "spec_helper"
require_relative "../app/app"
require "capybara"
require "capybara/rspec"
require "rack/test"

Capybara.app = Mindasaurus

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Rack::Test::Methods
end

