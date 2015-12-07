require 'rubygems'
require 'bundler'

# Load gems
EXCLUDED_GEMS = %w(rails puma)

Gem.loaded_specs['easy-app'].dependencies.each do |d|
  begin
    require d.name unless EXCLUDED_GEMS.include?(d.name)
  rescue Exception => e
    begin
      require d.name.gsub('-', '/')
    rescue Exception => e
      puts d.name
    end
  end
end

require 'tilt/coffee'

# Load Engine
module EasyAPP
  mattr_accessor :app_root
  mattr_accessor :owner_name
  mattr_accessor :owner_url

  require 'easy_app/engine'
  require 'easy_app/base'
  require 'easy_app/error'

  require 'easy_app/themes/bootstrap'
  require 'easy_app/themes/font_awesome'
  require 'easy_app/theme'

  require 'easy_app/redcarpet_filter'
  require 'easy_app/markdown_renderer'

  require 'easy_app/core_ext/bootstrap_form/instance_tag'
  require 'easy_app/core_ext/bootstrap_form/form_builder_patch'
  require 'easy_app/core_ext/date_validator/date_validator_patch'
  require 'easy_app/core_ext/string/quote'
end
