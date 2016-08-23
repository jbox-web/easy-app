module EasyAPP
  module DatesHelper

    def ll(date, opts = {})
      default = opts.delete(:default) { '' }
      date.blank? ? default : l(date, opts)
    end

  end
end
