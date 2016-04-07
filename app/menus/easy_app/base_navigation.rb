module EasyAPP
  class BaseNavigation < SimpleDelegator

    attr_reader :context
    attr_reader :options
    attr_reader :locales


    def initialize(view, context, options = {})
      super(view)
      @context = context
      @options = options
    end


    class << self

      def sidebar_menu_top_content=(content)
        @top_content = content
      end

      def sidebar_menu_top_content
        @top_content ||= []
      end

      def sidebar_menu_bottom_content=(content)
        @bottom_content = content
      end

      def sidebar_menu_bottom_content
        @bottom_content ||= []
      end

      def sidebar_menu_top_title=(title)
        @top_title = title
      end

      def sidebar_menu_top_title
        @top_title ||= I18n.t('layouts.sidebar.top.title')
      end

      def sidebar_menu_bottom_title=(title)
        @bottom_title = title
      end

      def sidebar_menu_bottom_title
        @bottom_title ||= I18n.t('layouts.sidebar.bottom.title')
      end

    end


    def render(locales = {})
      return unless renderable?
      @locales = locales
      render_navigation(navmenu_options, &nav_menu)
    end


    def sidebar_menu(&block)
      proc do |menu|
        menu.dom_class = get_current_theme.navmenu_class
        yield menu
      end
    end


    def topbar_right_menu(&block)
      proc do |menu|
        menu.dom_class = get_current_theme.navbar_top_right_class
        yield menu
      end
    end


    def topbar_left_menu(&block)
      proc do |menu|
        menu.dom_class = get_current_theme.navbar_top_left_class
        yield menu
      end
    end


    def dropdown_menu_class
      get_current_theme.dropdown_menu_class
    end


    def renderable?
      true
    end


    def navmenu_options
      { renderer: :bootstrap3, expand_all: true, skip_if_empty: true }
    end


    def get_current_theme
      @theme ||= ("#{current_theme.capitalize}::Theme".safe_constantize || EasyAPP::Theme)
    end

  end
end
