module EasyAPP
  module HighchartsHelper

    def render_highcharts_translations
      data = {}
      data[:months]       = t(:month_names, scope: :date).compact
      data[:weekdays]     = t(:day_names, scope: :date)
      data[:shortMonths]  = t(:abbr_month_names, scope: :date).compact
      data[:printChart]   = t('highcharts.print')
      data[:downloadJPEG] = t('highcharts.download.jpeg')
      data[:downloadPDF]  = t('highcharts.download.pdf')
      data[:downloadPNG]  = t('highcharts.download.png')
      data[:downloadSVG]  = t('highcharts.download.svg')
      data[:contextButtonTitle] = t('highcharts.menu')
      data.to_json
    end

  end
end
