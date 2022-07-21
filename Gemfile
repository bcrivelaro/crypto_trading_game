# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'bcrypt', '3.1.18'
gem 'bigdecimal', '3.1.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails', '2.7.6'
gem 'jwt', '2.4.1'
gem 'lograge', '0.12.0'
gem 'pagy', '5.10.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors', '1.1.1'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'redis', '4.7.1'
gem 'selenium-webdriver', '4.3.0'
gem 'sidekiq', '6.5.1'
gem 'sidekiq-cron', '1.6.0'

group :development, :test do
  gem 'bullet', '7.0.2'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '6.2.0'
  gem 'pry-rails', '0.3.9'
  gem 'rspec-rails', '5.1.2'
  gem 'rubocop', '1.32.0', require: false
  gem 'rubocop-rails', '2.15.2'
  gem 'shoulda-matchers', '5.1.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'simplecov', '0.21.2', require: false
  gem 'spring'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
