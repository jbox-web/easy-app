module EasyAPP
  class Engine < ::Rails::Engine
    isolate_namespace EasyAPP

    ActiveSupport::Inflector.inflections do |inflect|
      inflect.acronym 'APP'
    end

    initializer 'easy_app.load_app_root' do |app|
      EasyAPP.app_root = app.root
    end

    config.to_prepare do
      ApplicationController.helper(EasyAPP::Engine.helpers)
    end

    config.before_initialize do
      config.i18n.load_path += Dir[config.root.join('config', 'locales', '**', '*.yml').to_s]
      EasyAPP.current_user_method = :current_user
      config.assets.precompile += %w(paste.png)
    end

    config.after_initialize do
      Haml::Template.options[:attr_wrapper] = '"'

      SimpleNavigation::Configuration.run do |navigation|
        navigation.auto_highlight       = true
        navigation.highlight_on_subpath = true
      end

      Chartkick.options[:content_for] = :charts_js
    end
  end
end
