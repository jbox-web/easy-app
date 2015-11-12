module EasyAPP
  module AutocompleteHelper

    def render_autocomplete_field(id, url, opts = {})
      prepend  = opts.delete(:prepend) { true }
      position = prepend ? :prepend : :append
      options = { size: 40, position => button_with_icon('fa-search'), skip_label: true, 'data-auto-focus' => true }
      bootstrap_form_tag url: url, layout: :inline, html: { class: 'autocomplete-form' } do |f|
        f.autocomplete_field id, url, options
      end
    end

  end
end
