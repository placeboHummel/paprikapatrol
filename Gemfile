source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.5"
gem "puma", "~> 4.1"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "will_paginate", "~> 3.1.0"
gem "image_processing"
gem "ransack"
gem "font-awesome-rails"
gem "awesome_print"
gem "devise"
gem "devise-bulma-views", github: "thecodechef/devise-bulma-views"
gem "haml"
gem "bootsnap", ">= 1.4.2", require: false
gem "rexml"
gem "aws-sdk-s3"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails"
  gem "rails-controller-testing"
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "simplecov", require: false
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  gem "sqlite3", "~> 1.4"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "pg"
end
