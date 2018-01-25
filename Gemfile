source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'activeadmin'
gem 'aws-sdk', '~> 3.0', '>= 3.0.1'
gem 'bootstrap', '~> 4.0'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'cancancan', '~> 2.1', '>= 2.1.3'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'draper', '~> 3.0', '>= 3.0.1'
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'rails', '~> 5.1.4'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'simple_form', '~> 3.5'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'paperclip', '~> 5.2'
gem 'pry'
gem 'pry-rails'
gem 'rubocop', '~> 0.52.1'
gem 'whenever', '~> 0.10.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot', '~> 4.8', '>= 4.8.2'
  gem 'rspec', '~> 3.7'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'selenium-webdriver'
end

group :development do
  gem 'letter_opener', '~> 1.6'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
