module EasyAPP
  module Themes
    module Bootstrap
      extend self

      def navbar_top_right_class
        %w(nav navbar-nav navbar-right)
      end


      def navbar_top_left_class
        %w(nav navbar-nav navbar-left)
      end


      def navmenu_class
        %w(nav navmenu-nav)
      end


      def notify_mapping
        {
          success: 'success',
          error:   'danger',
          alert:   'danger',
          warning: 'warning',
          info:    'info',
          notice:  'info'
        }
      end


      def alert_mapping
        {
          success: 'alert-success',
          error:   'alert-danger',
          alert:   'alert-danger',
          warning: 'alert-warning',
          info:    'alert-info',
          notice:  'alert-info'
        }
      end


      def alert_default_class
        %w(alert fade in)
      end


      def full_width_class
        %w(col-md-12 col-sm-12)
      end


      def main_content_class
        %w(col-md-9 col-sm-9)
      end


      def sidebar_class
        %w(col-md-3 col-sm-3 hidden-xs)
      end


      def hidden_menu_class_mapping
        {
          canvas:   ['navbar', 'navbar-default', 'navbar-fixed-top', 'hidden-sm', 'hidden-md', 'hidden-lg'],
          collapse: ['navbar-header']
        }
      end


      def hidden_menu_options_mapping
        {
          canvas: { data: { toggle: 'offcanvas', recalc: 'false', canvas: 'body' } },
          collapse: { data: { toggle: 'collapse' } }
        }
      end


      def class_for_hidden_menu(type)
        hidden_menu_class_mapping[type]
      end


      def options_for_hidden_menu(type)
        hidden_menu_options_mapping[type]
      end

    end
  end
end
