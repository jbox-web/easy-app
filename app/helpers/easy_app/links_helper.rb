require 'uri'

module EasyAPP
  module LinksHelper

    def link_to_show(url, link_opts = {}, icon_opts = {})
      label = link_opts.delete(:label) { t('button.show') }
      icon  = icon_opts.delete(:icon) { 'fa-eye' }
      link_to_with_options(label, url, icon, link_opts, icon_opts)
    end


    def link_to_add(url, link_opts = {}, icon_opts = {})
      label = link_opts.delete(:label) { t('button.add') }
      icon  = icon_opts.delete(:icon) { 'fa-plus' }
      link_to_with_options(label, url, icon, link_opts, icon_opts)
    end


    def link_to_edit(url, link_opts = {}, icon_opts = {})
      label = link_opts.delete(:label) { t('button.edit') }
      icon  = icon_opts.delete(:icon) { 'fa-pencil' }
      link_to_with_options(label, url, icon, link_opts, icon_opts)
    end


    def link_to_mail(url, link_opts = {}, icon_opts = {})
      label = link_opts.delete(:label) { t('button.send_mail') }
      icon  = icon_opts.delete(:icon) { 'fa-envelope' }
      link_to_with_options(label, url, icon, link_opts, icon_opts)
    end


    def link_to_clone(url, link_opts = {}, icon_opts = {})
      label = link_opts.delete(:label) { t('button.clone') }
      icon  = icon_opts.delete(:icon) { 'fa-clone' }
      link_to_with_options(label, url, icon, link_opts, icon_opts)
    end


    def link_to_delete(url, link_opts = {}, icon_opts = {})
      label  = link_opts.delete(:label) { t('button.delete') }
      button = link_opts.fetch(:button, false)
      icon   = icon_opts.delete(:icon) { 'fa-trash-o' }
      link_opts = link_opts.merge(method: :delete, data: { confirm: t('text.are_you_sure') })
      if button
        css = link_opts.delete(:class){ '' }
        link_opts = link_opts.merge(class: [css, 'btn-danger'].join(' '))
      end
      link_to_with_options(label, url, icon, link_opts, icon_opts)
    end


    def link_to_modal(url, link_opts = {}, icon_opts = {})
      label = link_opts.delete(:label) { false }
      icon  = icon_opts.delete(:icon) { false }
      link_opts = link_opts.merge(modal: true)
      link_to_with_options(label, url, icon, link_opts, icon_opts)
    end


    def link_to_select_all(selector)
      function = "toggleCheckboxes(this, '#{selector}'); return false;"
      opts = { onchange: function, title: "#{t('button.check_all')}/#{t('button.uncheck_all')}", style: 'display: none;' }
      check_box_tag('select_all', '1', false, opts) +
      label_tag('select_all', check_icon(class: 'toggle-checkbox', title: "#{t('button.check_all')}/#{t('button.uncheck_all')}"))
    end


    def button_with_icon(icon, type: 'button')
      content_tag(:button, icon(icon, aligned: false, fixed: true), type: type, class: button_default_css_class)
    end


    def remote_toggle_button(url:, label:, id:, value:, checked:, field:, opts: {})
      options = { class: 'bootstrap-switch', data: { switch_callback: 'callToggleUrl(event, checked)', size: 'small', url: url, field: field } }.deep_merge(opts)
      content_tag(:div, id: "switch_#{id}", class: 'toggle-switch') do
        label_tag(id) do
          check_box_tag(id, value, checked, options) + "&nbsp;&nbsp; #{label}".html_safe
        end
      end
    end


    def link_to_with_options(label, url, icon_name, link_opts = {}, icon_opts = {})
      modal  = link_opts.delete(:modal) { false }
      button = link_opts.delete(:button) { false }

      link_opts = link_opts.merge(modal_options) if modal

      if button
        css = link_opts.delete(:class){ '' }
        link_opts = link_opts.merge(class: [css, *button_default_css_class].join(' '))
        icon_opts = icon_opts.reverse_merge(aligned: false)
      end

      if label && icon_name
        link_name = label_with_icon(label, icon_name, icon_opts.reverse_merge(bigger: false))
      elsif label && !icon_name
        link_name = label
      elsif icon_name && !label
        link_name = icon(icon_name, icon_opts)
      end

      link_to link_name, url, link_opts
    end


    def link_to_external(domain)
      link_to domain, "http://#{domain}", target: '_blank'
    end


    def button_default_css_class
      ['btn', 'btn-default']
    end


    def modal_options
      { remote: true, data: { toggle: 'ajax-modal', draggable: true }, onclick: 'openModalBox(this);' }
    end

  end
end
