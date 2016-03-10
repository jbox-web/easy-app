module EasyAPP
  module ChartkickHelper

    def render_chartkick_js
      content = clean_up_chartkick_js(content_for(:charts_js))
      content.join("\n").html_safe
    end


    private


      def clean_up_chartkick_js(content)
        content.gsub('<script type="text/javascript">', '')
                     .gsub('</script>', '')
                     .split("\n")
                     .select { |l| !l.blank? }
                     .map { |l| l.strip }
      end

  end
end
