ENV["RACK_ENV"] = "test"
require "grape"
require "rspec"
require "data_mapper"
require "database_cleaner"

Dir["./models/*.rb"].each { |file| require file }

DataMapper::setup(:default, "sqlite::memory:")
DataMapper::Model.raise_on_save_failure = false
DataMapper.finalize.auto_upgrade!

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

