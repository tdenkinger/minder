require 'sinatra'
require './lib/Reminder'
require './lib/DB'

r = Reminder.new Database.new

get '/' do
  "Nothing to see here."
end

post "/" do
  # r.add params[:stuff]
  p params
end

get "/reminders" do
  r.view
end
