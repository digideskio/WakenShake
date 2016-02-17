source 'https://rubygems.org'

# Ruby version
ruby '2.2.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgres as the database for Active Record
gem 'pg'
# Heroku requires this gem
gem 'rails_12factor'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Stripe API for handeling payments
gem 'stripe', git: 'https://github.com/stripe/stripe-ruby'

# Annotations for our model objects
gem 'annotate', '~> 2.6.6'

# Paperclip is for handling photos
gem "paperclip", "~> 4.2"

# AWS sdk gem for photo uploads/storage
gem 'aws-sdk'

# Devise is for login help
gem 'devise'

# for tiered access in the app
gem "cancan"

# for pagination
gem 'will_paginate', '~> 3.0.6'

# bootstrap integration with will_paginate
gem 'will_paginate-bootstrap'

# for better views
gem "haml-rails"

# for cool icons
gem "font-awesome-rails"

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use bootstrap to create good visual content
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'

# Google Analytics tracker
gem "google-analytics-rails"

# Seedbank organizes our seed data a little better so that it's not a mess seeding stuff
gem 'seedbank'

# Awesome print for queries
gem 'awesome_print'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # for testing email messages
  gem "letter_opener"
end
