module EasyAPP
  module IconsHelper

    def bool_to_icon(bool, opts = {})
      bool ? check_icon(opts) : cross_icon(opts)
    end


    def check_icon(opts = {})
      icon 'fa-check', { aligned: false, class: 'fa-success' }.merge(opts)
    end


    def cross_icon(opts = {})
      icon 'fa-cross', { aligned: false, class: 'fa-important' }.merge(opts)
    end


    def stacked_icon(name, opts = {})
      name = name.gsub('fa-', '')
      fa_stacked_icon(name, opts)
    end


    def icon_name_for(content_type)
      EasyAPP::Theme.icon_name_for(content_type) || 'fa-file'
    end


    def icon_for(content_type)
      icon(icon_name_for(content_type))
    end


    def icon(name, opts = {})
      options   = opts.dup
      color     = options.delete(:color){ nil }
      css_class = options.delete(:class){ [] }
      css_class = create_array(css_class)

      # Set icon options
      icon_options = {}
      icon_options[:style] = "color: #{color};" unless color.nil?
      icon_options[:class] = build_icon_css_class(options).push(name)
      icon_options[:class] = icon_options[:class].concat(css_class).uniq.compact

      # Merge our new hash with the rest of options
      icon_options = merge_hashes(icon_options, options)

      # Return icon
      content_tag(:i, '', icon_options)
    end


    private


      def build_icon_css_class(opts)
        # Treat opts hash
        inverse = opts.delete(:inverse) { false }
        fixed   = opts.delete(:fixed)   { false }
        aligned = opts.delete(:aligned) { true }
        bigger  = opts.delete(:bigger)  { true }

        css_class = ['fa']
        css_class.push('fa-lg') if bigger
        css_class.push('fa-align') if aligned
        css_class.push('fa-inverse') if inverse
        css_class.push('fa-fw') if fixed
        css_class
      end

  end
end
