module EasyAPP
  module Extensions
    module Tools
      extend ActiveSupport::Concern

      included do
        before_action :set_mini_profiler
      end


      def set_mini_profiler
        if current_user && current_user.admin?
          Rack::MiniProfiler.authorize_request
        end
      end

    end
  end
end
