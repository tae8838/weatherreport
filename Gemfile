source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'

gem 'bootstrap'
gem 'coffee-rails', '~> 4.2'
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'vuejs-rails'
gem 'whenever'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'shoulda'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
