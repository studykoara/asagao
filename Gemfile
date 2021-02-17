source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.8'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'

# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3'
end
# Use postgress for the production mode
gem 'pg', group: :production

# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'email_validator', '~> 1.6'
gem 'rails-i18n', '~> 5.1'
gem 'kaminari'
gem 'kaminari-i18n'
# Use Minitest
gem "minitest-rails", "~> 5.2.0"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'better_errors'               # Better Errors 本体
gem 'binding_of_caller'           # Better Errors 上で REPL を使用するための gem
gem 'hirb'                        # モデルの出力結果を表形式で表示する
gem 'hirb-unicode-steakknife'     # 本家 hirb-unicode は依存の unicode-display_width が
                                  # 古く他のgemと相性が悪い
gem 'awesome_print'               # Ruby オブジェクトに色をつけて表示して見やすくなる
gem 'pry-rails'                   # rails console(もしくは、rails c)で irb の代わりにpryを使う
gem 'pry-doc'                     # method を表示
gem 'pry-byebug'                  # デバッグを実施(Ruby 2.0 以降で動作する)
gem 'pry-stack_explorer'          # スタックをたどれる
gem 'rails-flog', require: 'flog' # Hash と SQL のログを見やすく整形


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
