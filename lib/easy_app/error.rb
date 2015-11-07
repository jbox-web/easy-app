module EasyAPP
  module Error

    class EasyAPPError      < StandardError; end
    class MenuNotFound      < EasyAPPError; end
    class ThemeNotFound     < EasyAPPError; end

  end
end
