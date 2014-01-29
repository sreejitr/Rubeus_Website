source 'https://rubygems.org'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
  gem 'capybara'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end
gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

#suggested gems by Todd
gem 'factory_girl_rails'
gem 'rspec-rails'
gem 'devise'

#stuff we added!

#rmagick 2.13.1 for Mac OS
gem 'rmagick', '2.13.1' if RUBY_PLATFORM =~ /darwin/
#rmagick 2.13.2 for Windows
gem 'rmagick', '2.13.2' if RUBY_PLATFORM =~ /cygwin|mswin|mingw|bccwin|wince|emx/
gem 'carrierwave'

gem 'bootstrap-sass'
gem 'rails_best_practices'
gem 'nokogiri'
gem 'simple-private-messages', '0.0.0', :git => 'git://github.com/jongilbraith/simple-private-messages.git'
group :development do
#  gem 'ruby-debug-base19x'
#  gem 'ruby-debug-ide'
end

ruby '1.9.3'
