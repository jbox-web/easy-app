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
  s.add_dependency 'rails', '~> 4.2', '>= 4.2.4'

  # Server
  s.add_dependency 'puma', '~> 2.14.0', '>= 2.14'

  # Database
  s.add_dependency 'mysql2', '~> 0.3.20', '>= 0.3'
  s.add_dependency 'pg',     '~> 0.18.2', '>= 0.18'

  # Configuration
  s.add_dependency 'settingslogic'

  # Javascript
  s.add_dependency 'coffee-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'turbolinks'
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
  s.add_dependency 'bootstrap_form'

  # Forms switches for checkboxes
  s.add_dependency 'bootstrap-switch-rails'

  # Tags input
  s.add_dependency 'bootstrap-tagsinput-rails'

  # Menus
  s.add_dependency 'simple-navigation'
  s.add_dependency 'simple_navigation_renderers'

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

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
