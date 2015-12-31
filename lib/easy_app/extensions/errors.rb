module EasyAPP
  module Extensions
    module Errors
      extend ActiveSupport::Concern

      def render_403(opts = {})
        @application = nil
        render_4xx_error({ message: t('errors.not_authorized'), status: 403 }.merge(opts))
        return false
      end


      def render_404(opts = {})
        render_4xx_error({ message: t('errors.file_not_found'), status: 404 }.merge(opts))
        return false
      end


      # Renders an error response
      def render_4xx_error(arg)
        arg = { message: arg } unless arg.is_a?(Hash)

        @message = arg[:message]
        @status  = arg[:status] || 500

        respond_to do |format|
          format.html { render template: 'common/error', layout: error_layout, status: @status }
          format.any { head @status }
        end
      end


      def error_layout
        request.xhr? ? false : send(EasyAPP.current_user_method).current_theme
      end

    end
  end
end
