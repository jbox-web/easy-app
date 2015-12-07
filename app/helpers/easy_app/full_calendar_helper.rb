module EasyAPP
  module FullCalendarHelper

    FULL_CALENDAR_FILE_PATH = Rails.root.join('config', 'full_calendar.yml')

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
        weekends:       false,
        first_day:      1,
        event_limit:    true,
        business_hours: {
          start: '09:00',
          end:   '18:00'
        },
        slot_duration:   '00:15:00',
        min_time:        '09:00:00',
        max_time:        '18:00:00',
        time_format:     'HH:mm',
        datetime_format: 'DD/MM/YYYY HH:mm',
        height:          500,
        drag_opacity:    0.5
      }.merge(full_calendar_config)
    end


    def full_calendar_config
      File.exists?(FULL_CALENDAR_FILE_PATH) ? (YAML::load_file(FULL_CALENDAR_FILE_PATH) || {}) : {}
    end

  end
end
