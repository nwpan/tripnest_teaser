source 'https://rubygems.org'

ruby "2.1.5"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
# pg for accessing the db, Postgres!
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-easing-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'bootstrap-sass', '~> 3.1.1'

gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails'

gem 'bootstrap_form'

# Thin is a Ruby web server, see: http://www.bigfastblog.com/rubys-eventmachine-part-3-thin
gem 'thin'

group :development, :test do
  # rspec BDD testing tool for Ruby
  gem 'rspec-rails'

  # debugger for Ruby
  gem 'byebug'
end

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end
