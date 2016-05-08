# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'easy_app/version'

Gem::Specification.new do |s|
  s.name        = 'easy-app'
  s.version     = EasyAPP::VERSION::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Nicolas Rodriguez']
  s.email       = ['nrodriguez@jbox-web.com']
  s.homepage    = 'https://github.com/jbox-web/easy-app'
  s.summary     = %q{A Ruby gem to ease creation of Rails Applications}
  s.description = %q{This gem is designed to provide helpers to ease creation of Rails Applications}
  s.license     = 'MIT'

  # Rails
  s.add_dependency 'rails', '~> 4.2', '>= 4.2.5'

  # Server
  s.add_dependency 'puma'

  # Database
  s.add_dependency 'mysql2'
  s.add_dependency 'pg'

  # Authentication Crypto
  s.add_dependency 'bcrypt'

  # Redis
  s.add_dependency 'redis'
  s.add_dependency 'hiredis'
  s.add_dependency 'em-synchrony'
  s.add_dependency 'redis-namespace'

  # Sessions and Cache
  s.add_dependency 'activerecord-session_store'
  s.add_dependency 'redis-rails'
  s.add_dependency 'redis-rack-cache'

  # Configuration
  s.add_dependency 'settingslogic'

  # Javascript
  s.add_dependency 'coffee-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'turbolinks'
  s.add_dependency 'jquery-turbolinks'
  s.add_dependency 'uglifier'

  # JSON
  s.add_dependency 'jbuilder'

  # Fonts
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'google-webfonts-rails'

  # CSS
  s.add_dependency 'sass-rails'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'autoprefixer-rails'

  # View rendering
  s.add_dependency 'haml-rails'

  # Forms
  s.add_dependency 'nested_form'
  s.add_dependency 'bootstrap_form'

  # Forms switches for checkboxes
  s.add_dependency 'bootstrap-switch-rails'

  # Tags input
  s.add_dependency 'bootstrap-tagsinput-rails'

  # Menus
  s.add_dependency 'simple-navigation'
  s.add_dependency 'simple_navigation_renderers'
  s.add_dependency 'rails_bootstrap_navbar'

  # Breadcrumbs
  s.add_dependency 'crummy'

  # Profiler
  s.add_dependency 'rack-mini-profiler'

  # Themes
  s.add_dependency 'themes_on_rails'

  # Faker
  s.add_dependency 'faker'

  # Select2
  s.add_dependency 'select2-rails'

  # Autocomplete
  s.add_dependency 'rails-jquery-autocomplete'

  # Search
  s.add_dependency 'pg_search'

  # JQueryDataTables
  s.add_dependency 'ajax-datatables-rails'

  # List views
  s.add_dependency 'smart_listing'

  # Markdown editor
  s.add_dependency 'rails-bootstrap-markdown'
  s.add_dependency 'html-pipeline'
  s.add_dependency 'redcarpet'
  s.add_dependency 'pygments.rb'
  s.add_dependency 'task_list'
  s.add_dependency 'rinku'

  # EMails
  s.add_dependency 'nokogiri'
  s.add_dependency 'premailer-rails'

  # Browsers compat
  s.add_dependency 'html5shiv-js-rails'
  s.add_dependency 'respond-js-rails'

  # DateValidator
  s.add_dependency 'date_validator'

  # FullCalendar
  s.add_dependency 'fullcalendar-rails'
  s.add_dependency 'momentjs-rails'

  # ColorPicker
  s.add_dependency 'jquery-minicolors-rails'

  # Copy/Past
  s.add_dependency 'zeroclipboard-rails'

  # Cron
  s.add_dependency 'whenever'

  # Phone number validation
  s.add_dependency 'phony_rails'

  # Timezone
  s.add_dependency 'tzinfo'

  # Country select
  s.add_dependency 'countries'
  s.add_dependency 'country_select'

  # Calculating and converting units of measure
  s.add_dependency 'measured-rails'

  # Money
  s.add_dependency 'money-rails'

  # Search forms
  s.add_dependency 'ransack'

  # Live Rails Logs
  s.add_dependency 'logster'

  # File upload
  s.add_dependency 'carrierwave'
  s.add_dependency 'mini_magick'
  s.add_dependency 'remotipart'

  # Favicons
  s.add_dependency 'favicon_maker'

  # PDF Generation
  s.add_dependency 'prawn'
  s.add_dependency 'prawn-table'
  s.add_dependency 'prawn_rails'

  # Locales
  s.add_dependency 'rails-i18n'

  # Autoincrement fields
  s.add_dependency 'auto_increment'

  # Charts
  s.add_dependency 'chartkick'
  s.add_dependency 'groupdate'

  # Users settings
  s.add_dependency 'ledermann-rails-settings'

  # ActsAsList
  s.add_dependency 'acts_as_list'

  # CSV Import
  s.add_dependency 'roo'
  s.add_dependency 'smarter_csv'

  # String conversion
  s.add_dependency 'iconv'

  # Store base STI class in DB instead of parent class
  s.add_dependency 'store_base_sti_class'

  # Generate Excel spreadsheets from any subclass of ActiveRecord::Base
  s.add_dependency 'zip-zip'
  s.add_dependency 'acts_as_xlsx'

  # Pretty print Rails console
  s.add_dependency 'awesome_print'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
