module EasyAPP
  module Extensions
    module Helpers
      extend ActiveSupport::Concern

      def get_model_name_for(klass, pluralize: true)
        count = pluralize ? 2 : 1
        klass.constantize.model_name.human(count: count)
      end


      def add_breadcrumb(label, icon, path)
        label = view_context.label_with_icon(label, icon, fixed: true, bigger: false)
        add_crumb label, path
      end


      included do
        helper_method :get_model_name_for
      end

    end
  end
end
