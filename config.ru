require "grape/rabl"
require "grape"
require "data_mapper"
require "./mindasaurus"
require "pry"

Dir["./lib/*.rb"].each { |file| require file }
Dir["./models/*.rb"].each { |file| require file }

DataMapper::setup(:default, (ENV["DATABASE_URL"] || "sqlite3://#{Dir.pwd}/db/mindasaurus.db"))
DataMapper.finalize.auto_upgrade!

Rabl.configure do |config|
  config.include_json_root = false
end

use Rack::Config do |env|
  env["api.tilt.root"] = "views"
end

run Mindasaurus::API
