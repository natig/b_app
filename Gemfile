source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
gem 'pg', '~> 0.17.0'
gem 'slim-rails', '~> 2.1.5'
gem 'bootstrap-sass', '~> 3.2.0.0'

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '~> 3.1.1'
gem 'turbolinks', '~> 2.2.2'
gem 'jbuilder', '~> 2.0'

#gem 'httparty', '~> 0.13.1'
#gem 'devise', '~> 3.2.4'

group :development, :test do
  #gem 'rspec', '2.14'
  gem "rspec-rails", '~> 2.14'
  gem 'spork-rails', '4.0.0'
  gem 'childprocess', '0.5.3'
  gem 'spring', '~> 1.1.3'
  #gem 'debugger', '~> 1.6.8'
  gem 'capistrano-rails', '~> 1.1.1'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'libnotify', '0.8.0'
  gem 'factory_girl_rails', '4.2.1'
  gem 'cucumber-rails', '1.4.0', :require => false
#  gem 'database_cleaner', github: 'bmabey/database_cleaner'
end

# See https://github.com/sstephenson/execjs
#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

#Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

#Use unicorn as the app server
gem 'unicorn', '~> 4.8.3'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0', require: false
end