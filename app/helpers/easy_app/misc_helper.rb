module EasyAPP
  module MiscHelper

    ## Misc
    def empty_value?(value)
      value.nil? || value.empty?
    end


    def display_on_condition(test, condition)
      test == condition ? '' : 'display: none;'
    end


    def disable_on_condition(test, condition)
      add_class_on_condition(test, condition, 'disabled')
    end


    def add_class_on_condition(test, condition, css)
      test == condition ? css : ''
    end


    def join_content(*args)
      args.join("\n").html_safe
    end


    def html_list(opts = {}, &block)
      opts[:class] = create_array(opts[:class]) if opts.has_key?(:class)
      options = merge_hashes({class: ['list-unstyled']}, opts)
      content_tag(:ul, options, &block)
    end


    def merge_hashes(left, right)
      # Merge it with html_options
      left.merge!(right) do |key, oldval, newval|
        (newval.is_a?(Array) ? (oldval + newval) : (oldval << newval)).uniq
      end
      left
    end


    def create_array(object)
      object = object.split(' ') if object.is_a?(String)
      object
    end


    def pp(hash)
      JSON.pretty_generate(hash)
    end


    def render_no_data(type: :info, label: t('.none_defined'))
      render_flash(type, label, false)
    end


    def merge_css_class(opts = {}, default_class = [])
      css_class = opts.delete(:class){ '' }
      css_class = css_class.split(' ')
      new_class = default_class.concat(css_class).compact
      opts[:class] = new_class
      opts
    end

  end
end
