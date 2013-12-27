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

    get "reminders/reminder/:id" do
      Reminders.retrieve params[:id]
    end

    get "reminders/:api_key" do
      Reminders.retrieve_by_key params[:api_key]
    end

    post :reminders do
      Reminders.add_reminder params[:reminder], params[:api_key]
    end

    post :register do
      user = Users.register params
      {:status => user[:status], :api_key => user[:message] }
    end

    post :login do
      api_key = Users.login params
      {:api_key => api_key}
    end

    get "/version" do
      File.read('version.txt')
    end

  end
end

