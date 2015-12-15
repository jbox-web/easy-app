module EasyAPP
  module Extensions
    module Tools
      extend ActiveSupport::Concern

      included do
        if defined?(Rack::MiniProfiler)
          before_action :set_mini_profiler
        end
      end


      def set_mini_profiler
        if current_user && current_user.admin?
          Rack::MiniProfiler.authorize_request
        end
      end

    end
  end
end
