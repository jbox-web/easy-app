require 'active_model/validations/date_validator'

module EasyAPP
  module CoreExt
    module DateValidator
      module DateValidatorPatch

        def self.included(base)
          base.send(:prepend, InstanceMethods)
        end


        module InstanceMethods

          # Patch DateValidator to work with *permanent_records* gem
          #
          def validate_each(record, attr_name, value)
            return if record.deleted?
            super
          end

        end

      end
    end
  end
end

unless ActiveModel::Validations::DateValidator.included_modules.include?(EasyAPP::CoreExt::DateValidator::DateValidatorPatch)
  ActiveModel::Validations::DateValidator.send(:include, EasyAPP::CoreExt::DateValidator::DateValidatorPatch)
end
