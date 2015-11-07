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

    config.after_initialize do
      Crummy.configure do |config|
        config.format            = :html_list
        config.ul_class          = 'breadcrumb'
        config.last_crumb_linked = false
      end

      SimpleNavigation::Configuration.run do |navigation|
        navigation.auto_highlight       = true
        navigation.highlight_on_subpath = true
      end
    end
  end
end
