module EasyAPP
  module DatesHelper

    def render_date(date)
      date != '' ? l(date) : ''
    end

  end
end
