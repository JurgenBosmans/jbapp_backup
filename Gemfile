source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.1.8'
gem "sass-rails", "~> 4.0.2"
gem 'uglifier', '2.4.0'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '2.1.0'
gem 'jbuilder', '1.5.3'
gem 'bcrypt-ruby', '3.1.2'

group :doc do
  gem 'sdoc', require: false
end

# development gems
group :development, :test do
  gem 'sqlite3', '1.3.8'    # test database
  gem 'figaro', '0.7.0'     # env variables
end

# production gems for heroku
group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'unicorn'  # jbo: toegevoegd voor snelheid stond in de railstutorial
end

# Paging
gem 'kaminari', '0.15.0'

# Slugs and friendly id's
gem 'friendly_id'

# font-awesome
gem 'font-awesome-sass' # Devise
gem 'devise', '3.2.2'

# Bootstrap 3
group :development, :test do
  gem 'rails_layout', '0.5.11'  # Bootstrap 3 layout generator
end

gem 'bootstrap-sass', '3.0.3.0'

# voor de nested forms
gem 'cocoon', '~> 1.2', '>= 1.2.6'
gem 'simple_form', '~> 3.2'

