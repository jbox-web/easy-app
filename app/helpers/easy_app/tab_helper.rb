module EasyAPP
  module TabHelper

    def navigation_tab(label, url, target, opts = {})
      active    = opts.delete(:active){ false }
      css_class = opts.delete(:class){ [] }
      options   = opts.deep_merge({ role: 'tab', data: { toggle: 'tab', target: target } })
      content   = link_to(label, url, options)
      css_class = css_class.push('active') if active
      content_tag(:li, content, class: css_class)
    end

  end
end
