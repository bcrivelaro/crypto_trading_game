# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'bcrypt', '3.1.16'
gem 'bigdecimal', '3.0.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails', '2.7.6'
gem 'jwt', '2.2.3'
gem 'lograge', '0.11.2'
gem 'pagy', '4.11.0'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'redis', '4.4.0'
gem 'selenium-webdriver', '3.142.7'
gem 'sidekiq', '6.2.2'
gem 'sidekiq-cron', '1.2.0'

group :development, :test do
  gem 'bullet', '6.1.5'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '6.2.0'
  gem 'pry-rails', '0.3.9'
  gem 'rspec-rails', '5.0.2'
  gem 'rubocop', '1.20.0', require: false
  gem 'rubocop-rails', '2.11.3'
  gem 'shoulda-matchers', '5.0.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'simplecov', '0.21.2', require: false
  gem 'spring'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
