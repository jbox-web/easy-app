module EasyAPP
  module PhoneHelper

    def link_to_phone(phone, link_opts = {}, phone_opts = {})
      return '' if phone.nil? || phone.empty?
      link_to label_with_icon(format_phone(phone, phone_opts), 'fa-phone'), "tel:#{phone}", link_opts
    end


    def format_phone(phone, opts = {})
      return '' if phone.nil?
      phone.phony_formatted(opts)
    end

  end
end
