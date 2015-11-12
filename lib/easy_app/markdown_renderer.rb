require 'html/pipeline'
require 'task_list/filter'

module EasyAPP
  module MarkdownRenderer
    extend self

    def to_html(markdown)
      pipeline.call(markdown)[:output].to_s
    end


    private


      def pipeline
        HTML::Pipeline.new(filters)
      end


      def filters
        [
          EasyAPP::RedcarpetFilter,
          TaskList::Filter,
          HTML::Pipeline::AutolinkFilter,
          HTML::Pipeline::TableOfContentsFilter
        ]
      end

  end
end
