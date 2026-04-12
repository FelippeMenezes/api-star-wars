source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.4'

gem 'rails', '~> 6.1.7', '>= 6.1.7.10' # Atualizado para a versão mais recente do Rails 6.1
gem 'pg', '~> 1.2'
gem 'puma', '~> 5.6'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.4'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.11'
gem 'redis', '~> 4.0'

# Gems obrigatórias para compatibilidade com Ruby 3.1+
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false
gem 'matrix'
gem 'logger' # Necessário para Ruby 3.1+

gem 'globalid', '>= 0.5.0'
gem 'bootsnap', '>= 1.15.0', require: false # Versão compatível com Ruby 3.1+

gem 'devise', '~> 4.9'

gem 'mini_racer', '>= 0.6.0'

gem 'autoprefixer-rails', '10.2.5.0'
gem 'font-awesome-sass', '~> 5.15'
gem 'simple_form'

group :development, :test do
  gem 'byebug'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.3'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.40'
  gem 'selenium-webdriver'
  gem 'webdrivers' # Mantido, mas a mensagem de post-install sugere que Selenium 4.11+ gerencia drivers
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
