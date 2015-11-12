require 'uri'

module EasyAPP
  module LinksHelper

    def link_to_show(url, link_opts = {}, icon_opts = {})
      label = link_opts.delete(:label) { '' }
      icon  = icon_opts.delete(:icon) { 'fa-eye' }
      link_to label_with_icon(label, icon, icon_opts.reverse_merge(bigger: false)), url, link_opts
    end


    def link_to_add(url, link_opts = {}, icon_opts = {})
      label = link_opts.delete(:label) { '' }
      icon  = icon_opts.delete(:icon) { 'fa-plus' }
      link_to label_with_icon(label, icon, icon_opts.reverse_merge(bigger: false)), url, link_opts
    end


    def link_to_edit(url, link_opts = {}, icon_opts = {})
      label = link_opts.delete(:label) { '' }
      icon  = icon_opts.delete(:icon) { 'fa-pencil' }
      link_to label_with_icon(label, icon, icon_opts.reverse_merge(bigger: false)), url, link_opts
    end


    def link_to_delete(url, link_opts = {}, icon_opts = {})
      label = link_opts.delete(:label) { '' }
      icon  = icon_opts.delete(:icon) { 'fa-trash-o' }
      link_opts = link_opts.merge(method: :delete, data: { confirm: t('text.are_you_sure') })
      link_to label_with_icon(label, icon, icon_opts.reverse_merge(bigger: false)), url, link_opts
    end


    def link_to_modal(url, link_opts = {}, icon_opts = {})
      label = link_opts.delete(:label) { '' }
      icon  = icon_opts.delete(:icon) { 'fa-plus' }
      link_opts = link_opts.merge(modal_options)
      link_to label_with_icon(label, icon, icon_opts.reverse_merge(bigger: false)), url, link_opts
    end


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
