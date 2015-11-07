module EasyAPP
  module ZeroClipboardHelper

    def zero_clipboard_button_for(target)
      render_zero_clipboard_button(target) + render_zero_clipboard_javascript(target)
    end


    private


      def render_zero_clipboard_button(target)
        content_tag(:div, id: "zc_#{target}", style: 'float: left;', data: zero_clipboard_options.merge('clipboard-target' => target)) do
          image_tag('paste.png')
        end
      end


      def render_zero_clipboard_javascript(target)
        javascript_tag("setZeroClipBoard('#zc_#{target}');")
      end


      def zero_clipboard_options
        { 'label-copied'  => t('text.copied'), 'label-to-copy' => t('text.copy_to_clipboard') }
      end

  end
end
