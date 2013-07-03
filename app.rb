require 'sinatra'
require 'sinatra/reloader'
require './lib/Reminder'
require './lib/DB'

r = Reminder.new Database.new

get '/' do
  redirect '/reminders'
end

post '/reminder' do
  r.add request.body.read
end

get "/reminders" do
  r.view
end
