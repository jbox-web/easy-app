module EasyAPP
  module LabelsHelper

    def label_with_tag(message, opts = {})
      opts[:class] = [opts[:class], 'label'].compact.join(' ')
      content_tag(:span, message, opts)
    end


    def label_with_image(label, image_name, image_opts = {})
      image_tag(image_name, image_opts.merge(class: 'addon-icon', size: '24x24')) + label
    end


    ## Labels
    def label_with_icon(label, icon_name, icon_opts = {})
      icon_name = icon_name.join(' ') if icon_name.is_a?(Array)
      icon(icon_name, icon_opts) + label
    end


    def label_with_stacked_icon(label, icon_name, icon_opts = {})
      icon_name = icon_name.join(' ') if icon_name.is_a?(Array)
      stacked_icon(icon_name, icon_opts) + label
    end


    def label_with_icon_warning(label)
      label_with_icon(label, 'fa-warning', fixed: true)
    end


    def label_with_icon_check(label)
      label_with_icon(label, 'fa-check', fixed: true)
    end


    def label_with_default_tag(label = nil, opts = {}, &block)
      label = yield if block_given?
      opts = opts.merge(class: ['label-default'])
      label_with_tag(label, opts)
    end


    def label_with_success_tag(label = nil, opts = {}, &block)
      label = yield if block_given?
      opts = opts.merge(class: ['label-success'])
      label_with_tag(label, opts)
    end


    def label_with_info_tag(label = nil, opts = {}, &block)
      label = yield if block_given?
      opts = opts.merge(class: ['label-info'])
      label_with_tag(label, opts)
    end


    def label_with_danger_tag(label = nil, opts = {}, &block)
      label = yield if block_given?
      opts = opts.merge(class: ['label-danger'])
      label_with_tag(label, opts)
    end


    def label_with_warning_tag(label = nil, opts = {}, &block)
      label = yield if block_given?
      opts = opts.merge(class: ['label-warning'])
      label_with_tag(label, opts)
    end


    def label_with_primary_tag(label = nil, opts = {}, &block)
      label = yield if block_given?
      opts = opts.merge(class: ['label-primary'])
      label_with_tag(label, opts)
    end

  end
end
