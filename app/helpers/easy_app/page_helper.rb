module EasyAPP
  module PageHelper

    def html_title(title)
      content_for(:title, title)
    end


    def page_title
      if @page_title.is_a?(Array)
        @page_title.join(' - ')
      elsif @page_title.nil?
        t('.title')
      else
        @page_title
      end
    end


    def set_html_title(icon: nil)
      label = icon.nil? ? page_title : label_with_icon(page_title, icon)
      !request.xhr? ? html_title(page_title) : html_title(label)
    end


    def page_lang
      @page_lang ||= I18n.default_locale
    end


    def render_copyright
      "<strong>Copyright</strong> #{easy_app_owner_link} &copy; #{EasyAPP.copyright_start}-#{Date.today.strftime("%Y")}".html_safe
    end


    def easy_app_owner_link
      link_to EasyAPP.owner_name, EasyAPP.owner_url, target: '_blank'
    end

  end
end
