source 'https://rubygems.org'

gem 'datamapper'
gem 'grape'
gem "grape-rabl"

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
