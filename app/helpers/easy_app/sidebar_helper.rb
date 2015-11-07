module EasyAPP
  module SidebarHelper

    def sidebar_content(opts = {}, &block)
      menu = capture(&block).strip
      !menu.empty? ? content_tag(:div, menu.html_safe, opts) : ''
    end

    alias_method :static_sidebar, :sidebar_content
    alias_method :sidebar_module, :sidebar_content

  end
end
