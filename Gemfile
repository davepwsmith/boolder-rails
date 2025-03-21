source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.5"

gem "rails", "~> 8.0"
gem "puma", ">= 5.0"
gem "pg"
gem "pg_search"
gem "activerecord-postgis-adapter"
gem "aws-sdk-s3"
gem "image_processing", "~> 1.2"
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails", "~> 4.0"
# gem "tailwindcss-ruby", "3.4.13" # pin to tailwindcss version 3.4.13
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data"
gem "solid_cache"
gem "solid_cable"
gem "solid_queue"
gem "mission_control-jobs"
gem "ostruct"

gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

gem "rack-cors"
gem "bugsnag"
gem "kaminari"
gem "httparty"
gem "colorize"
gem "audited"
gem "rgeo-geojson"
gem "differ"
gem "breadcrumbs_on_rails"
gem "meta-tags"

group :development, :test do
  gem "debug", require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "pry"
  gem "dotenv-rails"
end

group :development do
  gem "web-console"
  gem "nokogiri"
end

group :test do
  gem "capybara"
end
