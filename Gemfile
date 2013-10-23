source 'https://rubygems.org'
ruby "2.0.0"

gem 'sinatra'
gem 'sinatra-contrib'
gem 'datamapper'
gem 'json'

group :production do
  gem 'pg'
  gem 'dm-postgres-adapter'
end

group :development do
  gem 'dm-sqlite-adapter'
  gem 'rspec'
  gem 'sqlite3'
  gem 'rerun'
  gem 'rb-fsevent'
  gem 'rake'
end

group :test do
  gem 'database_cleaner', '~>1.1'
  gem 'capybara'
end
