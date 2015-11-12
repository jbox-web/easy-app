module EasyAPP
  module BreadcrumbsHelper

    def render_breadcrumbs(tag: :h4, tag_opts: {}, crumb_opts: {})
      request.xhr? ? '' : content_tag(tag, render_crumbs(crumb_opts), tag_opts)
    end

  end
end
