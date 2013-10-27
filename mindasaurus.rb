require "grape"
require "data_mapper"

Dir["./lib/*.rb"].each { |file| require file }
Dir["./models/*.rb"].each { |file| require file }

DataMapper::setup(:default, (ENV["DATABASE_URL"] || "sqlite3://#{Dir.pwd}/db/mindasaurus.db"))
DataMapper.finalize.auto_upgrade!

module Mindasaurus
  class API < Grape::API
    format :json

    get :reminders do
      Reminders.retrieve
    end

    get "reminders/:id" do
      Reminders.retrieve params[:id]
    end

    post :reminders do
      Reminders.add_reminder params[:reminder]
    end
  end
end

