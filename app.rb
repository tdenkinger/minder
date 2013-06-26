require 'sinatra'
require 'sinatra/reloader'
require './lib/Reminder'
require './lib/DB'

r = Reminder.new Database.new

get '/' do
  "Nothing to see here, pal."
end

get "/reminder/:reminder" do
  r.add params[:reminder]
end

get "/reminders" do
  r.view
end
