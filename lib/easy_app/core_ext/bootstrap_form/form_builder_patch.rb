require 'bootstrap_form/form_builder'

module EasyAPP
  module CoreExt
    module BootstrapForm
      module FormBuilderPatch

        def self.included(base)
          base.send(:prepend, InstanceMethods)
        end


        module InstanceMethods


          def autocomplete_field(method, source, options = {})
            form_group_builder(method, options) do
              prepend_and_append_input(options) do
                @template.autocomplete_field(@object_name, method, source, objectify_options(options))
              end
            end
          end


          def success(name = nil, options = {})
            # Get icon
            icon = options.delete(:icon) { 'fa-check' }

            # Get css options
            css_class = options.delete(:class){ nil }
            css_class = button_default_css_class.push(css_class).push('btn-success').compact

            # Merge options
            options.reverse_merge! class: css_class

            # Render button
            button(options) do
              @template.label_with_icon(name || submit_default_value, icon)
            end
          end


          def cancel(url, options = {})
            @template.link_to I18n.t('button.cancel'), url, class: button_default_css_class
          end


          def continue
            button(name: 'continue', class: 'btn btn-primary') do
              I18n.t('button.continue')
            end
          end


          def back
            button(name: 'back_button', class: 'btn btn-default') do
              I18n.t('button.back')
            end
          end


          def switch(method, opts = {})
            form_group_builder(method, wrapper: { class: 'shifted' }) do
              check_box(method, opts.merge(class: 'bootstrap-switch', label: '')) + @template.javascript_tag("createBootstrapSwitch('##{id_for(method, opts)}');")
            end
          end


          def datetime_picker(method, opts = {})
            icon   = opts.delete(:icon) { 'fa-calendar' }
            lang   = opts.delete(:lang) { I18.default_locale }
            step   = opts.delete(:step) { 15 }
            format = opts.delete(:format) { 'd/m/Y H:i' }

            js_options  = { lang: lang, step: step, format: format }
            btn_options = { onclick: "$('##{id_for(method)}').datetimepicker('show');" }
            input_opts  = { class: 'datetimepicker', append: @template.button_with_icon(icon, btn_options) }.merge(opts)

            text_field(method, input_opts) + @template.javascript_tag("$('##{id_for(method)}').datetimepicker(#{js_options.to_json});")
          end


          private


            def id_for(method, opts = {})
              BootstrapForm::InstanceTag.new(@object_name, method, @template, opts).id_for(opts)
            end


            def button_default_css_class
              ['btn', 'btn-default']
            end


            def generate_icon(icon)
              content_tag(:span, "", class: "fa fa-#{icon} form-control-feedback")
            end

        end

      end
    end
  end
end

unless BootstrapForm::FormBuilder.included_modules.include?(EasyAPP::CoreExt::BootstrapForm::FormBuilderPatch)
  BootstrapForm::FormBuilder.send(:include, EasyAPP::CoreExt::BootstrapForm::FormBuilderPatch)
end
