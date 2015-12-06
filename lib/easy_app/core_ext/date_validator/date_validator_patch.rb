require 'active_model/validations/date_validator'

module EasyAPP
  module CoreExt
    module DateValidator
      module DateValidatorPatch

        def self.included(base)
          base.send(:include, InstanceMethods)
          base.class_eval do
            alias_method_chain :validate_each, :easy_app
          end
        end


        module InstanceMethods

          # Patch DateValidator to work with *permanent_records* gem
          #
          def validate_each_with_easy_app(record, attr_name, value)
            return if record.deleted?
            validate_each_without_easy_app(record, attr_name, value)
          end

        end

      end
    end
  end
end

unless ActiveModel::Validations::DateValidator.included_modules.include?(EasyAPP::CoreExt::DateValidator::DateValidatorPatch)
  ActiveModel::Validations::DateValidator.send(:include, EasyAPP::CoreExt::DateValidator::DateValidatorPatch)
end
