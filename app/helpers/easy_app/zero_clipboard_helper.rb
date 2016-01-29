module EasyAPP
  module ZeroClipboardHelper

    def zero_clipboard_button_for(target, opts = {})
      render_zero_clipboard_button(target, opts) + render_zero_clipboard_javascript(target)
    end


    private


      def render_zero_clipboard_button(target, opts = {})
        options = zero_clipboard_options(target).merge(opts)
        content_tag(:div, image_tag('paste.png'), options)
      end


      def render_zero_clipboard_javascript(target)
        javascript_tag("setZeroClipBoard('#zc_#{target}');")
      end


      def zero_clipboard_options(target)
        {
          'id'   => "zc_#{target}",
          'data' => {
            'label-copied'     => t('text.copied'),
            'label-to-copy'    => t('text.copy_to_clipboard'),
            'clipboard-target' => target
          }
        }
      end

  end
end
