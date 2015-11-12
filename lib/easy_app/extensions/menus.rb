module EasyAPP
  module Extensions
    module Menus
      extend ActiveSupport::Concern

      included do
        before_action :reset_sidebar_menus
        before_action :set_page_lang
      end


      private


        def reset_sidebar_menus
          EasyAPP::BaseNavigation.sidebar_menu_top_title = nil
          EasyAPP::BaseNavigation.sidebar_menu_bottom_title = nil
          EasyAPP::BaseNavigation.sidebar_menu_top_content.clear
          EasyAPP::BaseNavigation.sidebar_menu_bottom_content.clear
        end


        def set_page_lang
          @page_lang = User.current.language
        end

    end
  end
end
