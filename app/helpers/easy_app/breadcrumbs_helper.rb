module EasyAPP
  module BreadcrumbsHelper

    def render_breadcrumbs(tag = :h4)
      request.xhr? ? '' : content_tag(tag, render_crumbs)
    end

  end
end
