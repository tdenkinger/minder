ENV["RACK_ENV"] = "test"
require "grape"
require "grape/rabl"
require "rspec"
require "rack/test"
require "data_mapper"
require "database_cleaner"
require "pry"

Dir["./lib/*.rb"].each { |file| require file }
Dir["./models/*.rb"].each { |file| require file }

DataMapper::setup(:default, "sqlite::memory:")
DataMapper::Model.raise_on_save_failure = false
DataMapper.finalize.auto_upgrade!

Rabl.configure do |config|
  config.include_json_root = false
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end


