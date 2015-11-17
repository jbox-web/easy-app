module EasyAPP
  module ThemeHelper

    def available_themes
      ThemesOnRails.all.sort
    end

  end
end
