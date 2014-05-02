require_relative "spec_helper"
require "capybara"
require "capybara/rspec"
require_relative "../../mindasaurus"

Capybara.app = Mindasaurus

RSpec.configure do |config|
  config.include Capybara::DSL
end

