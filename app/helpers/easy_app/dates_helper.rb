module EasyAPP
  module DatesHelper

    def ll(date, opts = {})
      date.blank? ? '' : l(date, opts)
    end

  end
end
