source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'pg', '~> 1.1'
gem 'dotenv-rails', '2.7.6'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'bcrypt', '3.1.16'
gem 'lograge', '0.11.2'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '5.0.2'
  gem 'factory_bot_rails', '6.2.0'
  gem 'shoulda-matchers', '5.0.0'
  gem 'pry-rails', '0.3.9'
  gem 'rubocop', '1.20.0', require: false
  gem 'rubocop-rails', '2.11.3'
  gem 'bullet', '6.1.5'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'simplecov', '0.21.2', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
