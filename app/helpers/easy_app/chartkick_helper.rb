module EasyAPP
  module ChartkickHelper

    def render_chartkick_js
      content = content_for(:charts_js)
      content.gsub('<script type="text/javascript">', '')
             .gsub('</script>', '')
             .split("\n")
             .select { |l| !l.blank? }
             .map { |l| l.strip }
             .join("\n")
             .html_safe
    end

  end
end
