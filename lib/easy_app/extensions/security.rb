module EasyAPP
  module Extensions
    module Security
      extend ActiveSupport::Concern

      included do
        protect_from_forgery with: :exception
      end
    end
  end
end
