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

  # Authentication
  s.add_dependency 'bcrypt'
  s.add_dependency 'activerecord-session_store'

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

  # Country select
  s.add_dependency 'country_select'

  # Calculating and converting units of measure
  s.add_dependency 'measured-rails'

  # Money
  s.add_dependency 'money-rails'

  # Search forms
  s.add_dependency 'ransack'

  # Live Rails Logs
  s.add_dependency 'redis'
  s.add_dependency 'logster'

  # File upload
  s.add_dependency 'carrierwave'
  s.add_dependency 'mini_magick'
  s.add_dependency 'remotipart'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
