module EasyAPP
  module Extensions
    module Modals
      extend ActiveSupport::Concern

      def render_modal_box(locals: {}, template: action_name)
        render template, layout: modal_or_application_layout, locals: locals
      end


      def modal_or_application_layout
        request.xhr? ? 'modal' : User.current.current_theme
      end

    end
  end
end
