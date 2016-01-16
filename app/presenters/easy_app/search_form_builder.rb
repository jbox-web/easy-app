module EasyAPP
  class SearchFormBuilder < BootstrapForm::FormBuilder

    def initialize(object_name, object, template, options)
      @datatable = options[:datatable]
      super
    end


    def search_field(name, opts = {})
      opts = opts.merge(filter_type: 'text', filter_container_id: name)
      escape_strings = opts.delete(:escape_strings){ [] }
      @datatable.escape_strings(escape_strings)
      @datatable.search_field(opts)
      content_tag(:div, '', id: name)
    end


    def select(name, opts = {})
      opts = opts.deep_merge(filter_type: 'select')
      select_field(name, opts)
    end


    def multi_select(name, opts = {})
      opts = opts.deep_merge(filter_type: 'multi_select')
      select_field(name, opts)
    end


    def render_datatable
      @datatable.render_datatable
    end


    private


      def select_field(name, opts = {})
        escape_strings = opts.delete(:escape_strings){ [] }
        opts = opts.deep_merge(filter_container_id: name, select_type: 'select2', select_type_options: { theme: 'bootstrap' })
        @datatable.escape_strings(escape_strings)
        @datatable.search_field(opts)
        content_tag(:div, '', id: name)
      end

  end
end
