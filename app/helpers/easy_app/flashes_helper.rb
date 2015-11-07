module EasyAPP
  module FlashesHelper

    def render_flashes(flashes: flash, dismiss: true)
      messages = []

      flashes.each do |type, message|
        if message.is_a?(String)
          messages << render_flash(type, message, dismiss)
        elsif message.is_a?(Array)
          messages += message.map { |msg| render_flash(type, msg, dismiss) }
        end
      end

      flashes.discard if flashes.respond_to?(:discard)

      messages = messages.map { |m| content_tag(:li, m) }
      html_list { join_content(messages) }
    end


    def render_flash(type, message, dismiss = true)
      icon      = flash_icon_for(type)
      css_class = flash_default_css.push(flash_class_for(type))
      css_class = css_class.push('dont-dismiss') if !dismiss
      content   = [ formated_flash_message(label_with_icon(message, icon)) ]
      content   = content.unshift(button_close) if dismiss
      flash_container(css_class: css_class) { content.join("\n").html_safe }
    end


    def render_flashes_as_js(target = '#flash-messages', opts = {})
      str = js_render(target, render_flashes, opts)
      str << "setAlertDismiss();\n"
      str.html_safe
    end


    def flash_container(css_class: '', &block)
      content_tag(:div, class: css_class, role: 'alert', &block)
    end


    def formated_flash_message(message)
      content_tag(:p, message)
    end


    def flash_icon_for(type)
      EasyAPP::Theme.flash_icon_for(type)
    end


    def flash_class_for(type)
      EasyAPP::Theme.flash_class_for(type)
    end


    def flash_default_css
      EasyAPP::Theme.flash_default_css
    end

  end
end
