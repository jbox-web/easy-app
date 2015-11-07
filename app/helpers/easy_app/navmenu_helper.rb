module EasyAPP
  module NavmenuHelper

    def nav_menu(opts = {}, &block)
      options = merge_css_class(opts, ['navmenu', 'navmenu-default'])
      options = options.merge(role: 'navigation')
      content = capture(&block).strip
      content.empty? ? '' : content_tag(:div, content.html_safe, options)
    end


    def responsive_nav_menu(id:, navbar_name:, navbar_id:, &block)
      content = nav_menu({ id: id, class: %w(navmenu-inverse navmenu-fixed-left offcanvas) }, &block)
      content.empty? ? '' : join_content(render_hidden_menu(navbar_name, navbar_id, "##{id}", :canvas), content)
    end


    private


      def render_hidden_menu(name, id, target, button_type)
        button_options = hidden_menu_html_options(button_type)
        button_options = button_options.deep_merge({ data: { target: target }, class: 'navbar-toggle' })
        content_tag(:div, join_content(toggle_button(button_options), brand_link(name, '#')), { id: id, class: hidden_menu_css_class(button_type) })
      end


      def hidden_menu_html_options(type)
        EasyAPP::Theme.options_for_hidden_menu(type)
      end


      def hidden_menu_css_class(type)
        EasyAPP::Theme.class_for_hidden_menu(type)
      end


      def toggle_button(opts = {})
        content_tag(:button, icon_bar_span, opts)
      end


      def icon_bar_span
        s = []
        3.times { s << content_tag(:span, '', class: 'icon-bar') }
        join_content(s)
      end

  end
end
