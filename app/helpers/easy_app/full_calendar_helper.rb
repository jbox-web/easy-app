module EasyAPP
  module FullCalendarHelper

    def render_full_calendar(opts = {})
      id  = opts.delete(:id) { 'calendar' }
      css = opts.delete(:class) { 'calendar' }
      options = full_calendar_options.merge(opts)
      content_tag(:div, '', id: id, class: css, data: options)
    end


    def full_calendar_options
      {
        header: {
          left:   'prev,next today',
          center: 'title',
          right:  'month,agendaWeek,agendaDay'
        },
        selectable:     true,
        editable:       true,
        first_day:      1,
        business_hours: true,
        slot_minutes:   15,
        event_limit:    true,
        height:         500,
        drag_opacity:   0.5,
        time_format:    'H:mm t'
      }
    end

  end
end
