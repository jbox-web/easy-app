module EasyAPP
  module ButtonsHelper

    ## Buttons
    def button_add(url, link_opts = {}, icon_opts = {})
      ## Get css options
      css_class = link_opts.delete(:class){ nil }
      css_class = [].push(css_class).compact

      ## Set options
      link_opts = { title: t('button.add'), class: css_class }.merge(link_opts)
      icon_opts = { bigger: false }.merge(icon_opts)
      icon_name = icon_opts.delete(:icon) { 'fa-plus' }

      ## Return link
      link_to_icon(icon_name, url, link_opts, icon_opts)
    end


    def button_modal_add(url, link_opts = {}, icon_opts = {})
      link_opts = link_opts.deep_merge(modal_options)
      button_add(url, link_opts, icon_opts)
    end


    def button_modal(url, link_opts = {}, icon_opts = {})
      ## Get css options
      css_class = link_opts.delete(:class){ nil }
      css_class = button_default_css_class.push(css_class).compact

      ## Set options
      link_opts = { class: css_class }.merge(link_opts)
      link_opts = modal_options.deep_merge(link_opts)
      icon_name = icon_opts.delete(:icon) { 'fa-plus' }
      icon_opts = { bigger: false }.merge(icon_opts)

      ## Return link
      link_to_icon(icon_name, url, link_opts, icon_opts)
    end


    def button_clone(url, link_opts = {}, icon_opts = {})
      ## Get css options
      css_class = link_opts.delete(:class){ nil }
      css_class = button_default_css_class.push(css_class).compact

      ## Set options
      link_opts = { title: t('button.clone'), class: css_class }.merge(link_opts)
      icon_name = icon_opts.delete(:icon) { 'fa-clone' }

      ## Return link
      link_to_icon(icon_name, url, link_opts, icon_opts)
    end


    def button_edit(url, link_opts = {}, icon_opts = {})
      ## Get css options
      css_class = link_opts.delete(:class){ nil }
      css_class = button_default_css_class.push(css_class).compact

      ## Set options
      link_opts = { title: t('button.edit'), class: css_class }.merge(link_opts)
      icon_name = icon_opts.delete(:icon) { 'fa-edit' }

      ## Return link
      link_to_icon(icon_name, url, link_opts, icon_opts)
    end


    def button_modal_edit(url, link_opts = {}, icon_opts = {})
      link_opts = modal_options.deep_merge(link_opts)
      button_edit(url, link_opts, icon_opts)
    end


    def button_refresh(function, link_opts = {}, icon_opts = {})
      ## Get css options
      css_class = link_opts.delete(:class){ nil }
      css_class = [].push(css_class).compact

      ## Set options
      link_opts = { title: t('button.refresh'), onclick: function, class: css_class }.merge(link_opts)
      icon_name = icon_opts.delete(:icon) { 'fa-refresh' }

      link_to_icon(icon_name, '#', link_opts, icon_opts)
    end


    def button_delete(url, link_opts = {}, icon_opts = {})
      ## Get css options
      css_class = link_opts.delete(:class){ nil }
      css_class = button_default_css_class.push(css_class).push('btn-danger').compact

      ## Get html options
      confirm = link_opts.delete(:confirm){ true }
      data = confirm ? { confirm: t('text.are_you_sure') } : {}

      ## Set options
      link_opts = { title: t('button.delete'), class: css_class, method: :delete, data: data }.merge(link_opts)
      icon_name = icon_opts.delete(:icon) { 'fa-trash-o' }

      ## Return link
      link_to_icon(icon_name, url, link_opts, icon_opts)
    end


    def button_cancel(url, link_opts = {}, icon_opts = {})
      ## Get css options
      css_class = link_opts.delete(:class){ nil }
      css_class = button_default_css_class.push(css_class).compact

      ## Set options
      link_opts = { title: t('button.cancel'), label: t('button.cancel'), class: css_class }.merge(link_opts)
      icon_name = icon_opts.delete(:icon) { 'fa-close' }

      ## Return link
      link_to_icon(icon_name, url, link_opts, icon_opts)
    end


    def button_select_all(function)
      opts = { onclick: function, title: "#{t('button.check_all')}/#{t('button.uncheck_all')}" }
      link_to check_icon(class: 'toggle-checkbox'), '#', opts
    end


    def button_submit(label, opts = {})
      css_class = opts.delete(:class){ nil }
      new_class = ['btn', 'btn-success'].push(css_class).compact
      icon      = opts.delete(:icon){ 'fa-check' }

      button_tag(opts.merge(class: new_class)) do
        label_with_icon(label, icon, fixed: true)
      end
    end


    def button_close
      content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
        content_tag(:span, '&times;'.html_safe, 'aria-hidden' => 'true') +
        content_tag(:span, 'Close', class: 'sr-only')
      end
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


    def button_default_css_class
      ['btn', 'btn-default']
    end


    def modal_options
      { remote: true, data: { toggle: 'ajax-modal', draggable: true } }
    end

  end
end
