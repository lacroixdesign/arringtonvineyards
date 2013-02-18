source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.12'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "rail_pass"

group :development do
  gem "quiet_assets"
  gem "letter_opener"
  gem "thin"
  gem "awesome_print"
  gem "hirb"
  gem "better_errors"
  gem "binding_of_caller"
  gem "pry"
end

group :development, :test do
  gem "rspec-rails"
  gem "database_cleaner"
end

group :test do
  gem "capybara"
  gem "shoulda-matchers"
  gem "spork-rails"
end

gem "exception_notification", "2.6.1"
gem "haml-rails"
gem "boarding_pass"
gem "foreman"
gem "pg", :group => :production
gem "sqlite3", :group => :development
gem "rails-erd", :group => :development
gem "unicorn"
gem "newrelic_rpm"
