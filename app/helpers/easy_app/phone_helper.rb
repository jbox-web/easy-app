module EasyAPP
  module PhoneHelper

    def format_phone(phone, opts = {})
      return '' if phone.nil?
      phone.phony_formatted(opts)
    end

  end
end
