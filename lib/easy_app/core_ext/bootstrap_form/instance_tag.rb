module EasyAPP
  module CoreExt
    module BootstrapForm
      class InstanceTag < ActionView::Helpers::Tags::Base

        def id_for(options)
          add_default_name_and_id(options)
          options['id']
        end

      end
    end
  end
end
