module EasyAPP
  module NavigationHelper

    # Here we create zones for menus :
    # We have 3 zones :
    # 1. the header menu
    # 2. the top menu of the left sidebar
    # 3. the bottom menu of the left sidebar


    def render_topbar_right_menu
      render_menu(:topbar_right) if menu_exists?(:topbar_right)
    end


    def render_topbar_left_menu
      render_menu(:topbar_left) if menu_exists?(:topbar_left)
    end


    def sidebar_menu_top_title
      EasyAPP::BaseNavigation.sidebar_menu_top_title
    end


    def sidebar_menu_bottom_title
      EasyAPP::BaseNavigation.sidebar_menu_bottom_title
    end


    def render_sidebar_menu_top(prefix: nil)
      render_sidebar_menu(EasyAPP::BaseNavigation.sidebar_menu_top_content, prefix)
    end


    def render_sidebar_menu_bottom(prefix: nil)
      render_sidebar_menu(EasyAPP::BaseNavigation.sidebar_menu_bottom_content, prefix)
    end


    def render_sidebar_menu(items, prefix)
      items.map { |m| render_menu(m, prefix: prefix) }.compact.join.html_safe
    end


    def render_page_content(sidebar_partial:, page_partial:, class_with_sidebar:, class_without_sidebar:)
      sidebar = render sidebar_partial
      if sidebar.strip != ''
        sidebar + render_page_within_layout(page_partial, class: class_with_sidebar)
      else
        render_page_within_layout(page_partial, class: class_without_sidebar)
      end
    end


    def render_page_within_layout(partial, opts = {})
      content_tag(:div, render(partial), opts)
    end


    def locals_for(menu, &block)
      @locals_for ||= {}
      if block_given?
        @locals_for[menu] = block
      else
        @locals_for[menu]
      end
    end


    def render_menu(menu, opts = {})
      locals = locals_for(:menus)
      locals = locals.call unless locals.nil?
      klass  = find_menu(menu)
      klass.new(self, opts).render(locals)
    end


    def find_menu(menu)
      begin
        klass = constantize_menu(menu)
      rescue NameError
        raise EasyAPP::Error::MenuNotFound, "MenuNotFound: #{menu}_navigation"
      else
        klass
      end
    end


    def menu_exists?(menu)
      constantize_menu(menu)
      true
    rescue NameError
      false
    end


    def constantize_menu(menu)
      klass_name = "#{menu}_navigation"
      klass_name.camelize.constantize
    end

  end
end
