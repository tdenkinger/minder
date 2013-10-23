require "sinatra/base"
require "data_mapper"
require "sinatra/json"

Dir["./lib/*.rb"].each { |file| require file }
# Dir["./models/*.rb"].each { |file| require file }

DataMapper::setup(:default, (ENV["DATABASE_URL"] || "sqlite3://#{Dir.pwd}/db/mindasaurus.db"))
DataMapper.finalize.auto_upgrade!

class Mindasaurus < Sinatra::Base
  helpers Sinatra::JSON

  get '/' do
    redirect '/reminders'
  end

  post '/reminder' do
    # r.add request.body.read
  end

  get "/reminders" do
    # r.view
  end

end

if ENV["RACK_ENV"] != "test"
  Mindasaurus.run!
end


