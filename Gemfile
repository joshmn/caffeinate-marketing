source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'caffeinate'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'turbolinks'
gem 'mimemagic', '0.3.5', git: 'https://github.com/mimemagicrb/mimemagic', ref: '01f92d8'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem "devise", "~> 4.7"

gem "ahoy_matey", "~> 3.0"
gem 'activeadmin'
