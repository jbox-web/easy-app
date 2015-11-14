module EasyAPP
  class DataColumn

    def initialize(view, label, opts = {})
      @view  = view
      @label = label
      @opts  = opts
    end


    def to_s
      @view.content_tag(:th, @label, class: css_class)
    end


    def sortable?
      @opts.fetch(:sortable, true)
    end


    def searchable?
      @opts.fetch(:searchable, true)
    end


    def css_class
      css = []
      css << 'no-search' unless searchable?
      css << 'no-sort' unless sortable?
      css
    end

  end
end
