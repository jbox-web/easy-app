module EasyAPP
  module Theme
    extend self

    def icon_pack=(icon_pack)
      @icon_pack = find_klass(icon_pack)
    end


    def css_framework=(css_framework)
      @css_framework = find_klass(css_framework)
    end


    def site_fonts=(fonts)
      @fonts = fonts
    end


    def icon_pack
      @icon_pack ||= EasyAPP::Themes::FontAwesome
    end


    def css_framework
      @css_framework ||= EasyAPP::Themes::Bootstrap
    end


    def site_fonts
      @fonts ||= %w(Ubuntu Pacifico)
    end


    ### ICONS FRAMEWORK ###

    def flash_icon_for(type)
      icon_pack.alert_icons_mapping[type.to_sym]
    end


    def icon_name_for(type)
      icon_pack.icons_mapping[type]
    end


    def icon_name_for_prefix(prefix)
      prefix = prefix.downcase.sub('&', '_').to_sym
      icon_pack.prefix_icons_mapping[prefix]
    end


    def image_file?(content_type)
      icon_pack.image_icons_mapping.keys.include?(content_type)
    end


    def archive_file?(content_type)
      icon_pack.archive_icons_mapping.keys.include?(content_type)
    end


    def document_file?(content_type)
      icon_pack.document_icons_mapping.keys.include?(content_type)
    end


    def get_file_type(content_type)
      if image_file?(content_type)
        :image
      elsif archive_file?(content_type)
        :archive
      elsif document_file?(content_type)
        :document
      else
        :unknown
      end
    end


    ### CSS FRAMEWORK ###

    def flash_class_for(type)
      css_framework.alert_mapping[type.to_sym]
    end


    def flash_default_css
      css_framework.alert_default_class.clone
    end


    def navmenu_class
      css_framework.navmenu_class
    end


    def navbar_top_right_class
      css_framework.navbar_top_right_class
    end


    def navbar_top_left_class
      css_framework.navbar_top_left_class
    end


    def full_width_class
      css_framework.full_width_class
    end


    def main_content_class
      css_framework.main_content_class
    end


    def sidebar_class
      css_framework.sidebar_class
    end


    def class_for_hidden_menu(type)
      css_framework.class_for_hidden_menu(type)
    end


    def options_for_hidden_menu(type)
      css_framework.options_for_hidden_menu(type)
    end


    private


      def find_klass(klass)
        begin
          klass = klass.constantize
        rescue NameError => e
          raise EasyAPP::Error::ThemeNotFound, "ThemeNotFound: #{klass}"
        else
          klass
        end
      end

  end
end
