module EasyAPP
  module MenusHelper

    # Here we create zones for menus :
    # We have 3 zones :
    # 1. the header menu
    # 2. the top menu of the left sidebar
    # 3. the bottom menu of the left sidebar


    def render_topbar_right_menu(context = nil, opts = {})
      render_menu(:topbar_right, context, opts.reverse_merge(check_klass_presence: true))
    end


    def render_topbar_left_menu(context = nil, opts = {})
      render_menu(:topbar_left, context, opts)
    end


    def sidebar_menu_top_title
      EasyAPP::BaseNavigation.sidebar_menu_top_title
    end


    def sidebar_menu_bottom_title
      EasyAPP::BaseNavigation.sidebar_menu_bottom_title
    end


    def render_sidebar_menu_top(context = nil, opts = {})
      render_sidebar_menu(EasyAPP::BaseNavigation.sidebar_menu_top_content, context, opts)
    end


    def render_sidebar_menu_bottom(context = nil, opts = {})
      render_sidebar_menu(EasyAPP::BaseNavigation.sidebar_menu_bottom_content, context, opts)
    end


    def render_sidebar_menu(items, context, opts = {})
      items.map { |m| render_menu(m, context, opts) }.compact.join.html_safe
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


    def render_menu(menu, context = nil, opts = {})
      locals = locals_for(:menus)
      locals = locals.call unless locals.nil?
      check_klass_presence = opts.delete(:check_klass_presence) { false }
      context_menu = context ? "#{menu}_for_#{context.model_name.to_s.downcase}".to_sym : nil
      menu = menu_exists?(context_menu) ? context_menu : menu
      return if !menu_exists?(menu) && !check_klass_presence
      klass  = find_menu(menu)
      klass.new(self, context, opts).render(locals)
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
