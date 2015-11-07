require 'uri'

module EasyAPP
  module LinksHelper

    def link_to_icon(icon_name, url, link_opts = {}, icon_opts = {})
      label     = link_opts.delete(:label) { nil }
      hide_icon = icon_opts.delete(:hide_icon) { false }

      link_to(url, link_opts) do
        if label && hide_icon
          label
        elsif label
          label_with_icon(label, icon_name, icon_opts)
        else
          icon(icon_name, { aligned: false }.merge(icon_opts))
        end
      end
    end


    def link_to_external(domain)
      link_to domain, "http://#{domain}", target: '_blank'
    end

  end
end
