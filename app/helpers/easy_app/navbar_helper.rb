module EasyAPP
  module NavbarHelper

    def navbar_collapse(options = {}, &block)
      options = options.dup
      css_classes = %w(collapse navbar-collapse).tap do |css_classes|
        css_classes << options.delete(:class) if options.has_key?(:class)
      end
      attributes = options.reverse_merge(class: css_classes.join(' '), id: 'navbar-collapsable')
      if block_given?
        menu = capture(&block)
        return '' if menu.strip.empty?
        content_tag(:div, menu, attributes)
      else
        ''
      end
    end


    def navbar_header(options = {}, &block)
      options = options.dup
      data = options.delete(:data){ { toggle: 'collapse', target: '#navbar-collapsable'} }
      brand, brand_link = options.delete(:brand), options.delete(:brand_link)
      css_classes = %w(navbar-header).tap do |css_classes|
        css_classes << options.delete(:class) if options.has_key?(:class)
      end
      attributes = attributes_for_tag(options.reverse_merge(class: css_classes.join(' ')))
      prepare_html <<-HTML.chomp!
  <div#{attributes}>
    <button type="button" class="navbar-toggle" #{render_navbar_datas(data)}>
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    #{brand_link brand, brand_link unless brand.nil?}
    #{capture(&block) if block_given?}
  </div>
  HTML
    end


    private


      def render_navbar_datas(data)
        datas = []
        data.each do |k, v|
          datas << "data-#{k}=#{v}"
        end
        datas.join(' ')
      end

  end
end
