module EasyAPP
  module Themes
    module FontAwesome
      extend self

      FONT_AWESOME_DEFAULT_CLASS    = %w(fa fa-align)

      def icons_mapping
        {}.merge(alert_icons_mapping)
          .merge(image_icons_mapping)
          .merge(archive_icons_mapping)
          .merge(document_icons_mapping)
          .merge(prefix_icons_mapping)
          .merge(direction_icons_mapping)
      end


      def prefix_icons_mapping
        {
          m:     'fa-mars',
          mme:   'fa-venus',
          m2:    'fa-mars-double',
          mme2:  'fa-venus-double',
          m_mme: 'fa-venus-mars'
        }
      end


      def alert_icons_mapping
        {
          success: 'fa-check',
          error:   'fa-exclamation',
          alert:   'fa-exclamation',
          warning: 'fa-warning',
          info:    'fa-info-circle',
          notice:  'fa-info-circle'
        }
      end


      def image_icons_mapping
        {
          'image/jpeg' => 'fa-file-image-o',
          'image/jpg'  => 'fa-file-image-o',
          'image/gif'  => 'fa-file-image-o',
          'image/png'  => 'fa-file-image-o'
        }
      end


      def archive_icons_mapping
        {
          'application/gzip'   => 'fa-file-archive-o',
          'application/zip'    => 'fa-file-archive-o',
          'application/x-gzip' => 'fa-file-archive-o',
          'application/x-zip'  => 'fa-file-archive-o',
          'application/x-tar'  => 'fa-file-archive-o'
        }
      end


      def document_icons_mapping
        {
          'application/pdf'                                                          => 'fa-file-pdf-o',
          'application/vnd.oasis.opendocument.text'                                  => 'fa-file-word-o',
          'application/vnd.openxmlformats-officedocument.wordprocessingml.document'  => 'fa-file-word-o',
          'application/msword'                                                       => 'fa-file-word-o',
          'application/vnd.oasis.opendocument.spreadsheet'                           => 'fa-file-excel-o',
          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'        => 'fa-file-excel-o',
          'application/vnd.ms-excel'                                                 => 'fa-file-excel-o'
        }
      end


      def direction_icons_mapping
        {
          top:    'fa-angle-double-up',
          up:     'fa-angle-up',
          down:   'fa-angle-down',
          bottom: 'fa-angle-double-down'
        }
      end

    end
  end
end
