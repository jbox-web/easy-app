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


          def primary(name = nil, options = {})
            # Get icon
            icon = options.delete(:icon) { nil }
            icon_opts = options.delete(:icon_opts) { {} }

            # Get css options
            css_class = options.delete(:class){ nil }
            css_class = button_default_css_class.push(css_class).push('btn-primary').compact

            # Merge options
            options.reverse_merge! class: css_class

            # Render button
            if icon
              button(options) do
                @template.label_with_icon(name || submit_default_value, icon, icon_opts)
              end
            else
              submit(name, options)
            end
          end


          def success(name = nil, options = {})
            # Get icon
            icon = options.delete(:icon) { 'fa-check' }
            icon_opts = options.delete(:icon_opts) { {} }

            # Get css options
            css_class = options.delete(:class){ nil }
            css_class = button_default_css_class.push(css_class).push('btn-success').compact

            # Merge options
            options.reverse_merge! class: css_class

            # Render button
            button(options) do
              @template.label_with_icon(name || submit_default_value, icon, icon_opts)
            end
          end


          def cancel(url, options = {})
            # Get css options
            css_class = options.delete(:class){ nil }
            css_class = button_default_css_class.push(css_class).push('btn-default').compact

            @template.link_to I18n.t('button.cancel'), url, class: css_class
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


          def switch(method, options = {}, html_options = {})
            form_group_options = html_options.reverse_merge(wrapper: { class: 'shifted' })
            check_box_options  = options.reverse_merge(class: 'bootstrap-switch', label: '')

            form_group_builder(method, options, form_group_options) do
              check_box(method, check_box_options) + @template.javascript_tag("createBootstrapSwitch('##{id_for(method, options)}');")
            end
          end


          def datetime_picker(method, opts = {}, dt_opts = {})
            icon        = opts.delete(:icon) { 'fa-calendar' }
            js_options  = get_datetimepicker_options(method, dt_opts)
            btn_options = { onclick: "$('##{id_for(method)}').datetimepicker('show');" }
            input_opts  = { class: 'datetimepicker', append: @template.button_with_icon(icon, btn_options) }.merge(opts)
            text_field(method, input_opts) + @template.javascript_tag("$('##{id_for(method)}').datetimepicker(#{js_options});")
          end


          def country_select(name, options = {}, html_options = {})
            form_group_builder(name, options, html_options) do
              content_tag(:div, super, class: control_specific_class('country_select'))
            end
          end


          private


            def id_for(method, opts = {})
              BootstrapForm::InstanceTag.new(@object_name, method, @template, opts).id_for(opts)
            end


            def button_default_css_class
              ['btn']
            end


            def generate_icon(icon)
              content_tag(:span, "", class: "fa fa-#{icon} form-control-feedback")
            end


            def get_datetimepicker_options(method, opts = {})
              lang    = opts.delete(:lang) { I18.default_locale }
              step    = opts.delete(:step) { 15 }
              format  = opts.delete(:format) { 'd/m/Y H:i' }
              bind_to = opts.delete(:bind_to) { nil }
              bind_on = opts.delete(:bind_on) { 'maxDate' }

              js_options = { lang: lang, step: step, format: format }.merge(opts)

              if bind_to
                on_show    = js_on_show_for(bind_to, bind_on)
                js_options = js_options.merge({ onShow: on_show })
              end

              js_options = js_options.to_json
              js_options = js_options.gsub(on_show.quote, on_show.unquote) if bind_to
              js_options = js_options.gsub('onShow'.quote, 'onShow'.unquote) if bind_to
              js_options
            end


            def js_on_show_for(element, attribute)
              "function(ct){ this.setOptions({ #{attribute}: $('#{element}').val() ? $('#{element}').val() : false }) }"
            end

        end

      end
    end
  end
end

unless BootstrapForm::FormBuilder.included_modules.include?(EasyAPP::CoreExt::BootstrapForm::FormBuilderPatch)
  BootstrapForm::FormBuilder.send(:include, EasyAPP::CoreExt::BootstrapForm::FormBuilderPatch)
end
