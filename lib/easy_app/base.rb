require 'easy_app/extensions/errors'
require 'easy_app/extensions/helpers'
require 'easy_app/extensions/modals'
require 'easy_app/extensions/tools'

module EasyAPP
  module Base
    extend ActiveSupport::Concern

    included do
      send(:include, EasyAPP::Extensions::Errors)
      send(:include, EasyAPP::Extensions::Helpers)
      send(:include, EasyAPP::Extensions::Modals)
      send(:include, EasyAPP::Extensions::Tools)
    end

  end
end
