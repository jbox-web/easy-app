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
        if mini_profiler_enabled? && mini_profiler_authorized?
          Rack::MiniProfiler.authorize_request
        end
      end


      def mini_profiler_enabled?
        true
      end


      def mini_profiler_authorized?
        current_user && current_user.admin?
      end

    end
  end
end
