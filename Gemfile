source 'https://rubygems.org'

ruby '1.9.3'

gem 'sinatra', '~> 1.4.4'
gem 'slim'
gem 'sinatra-asset-pipeline', require: 'sinatra/asset_pipeline'
gem 'sinatra-contrib'
gem 'redis'

group :development do
  gem 'shotgun'
  gem 'pry'
  gem 'pry-debugger'
end

group :test do
  gem 'minitest', '~> 5.2.0'
  gem 'guard'
  gem 'guard-minitest'
  gem 'capybara_minitest_spec'
end

group :test, :development do
  gem 'rake'
  gem 'pry'
end

group :assets do
  gem 'sass'
  gem 'uglifier'
end
