root = exports ? this

root.FullCalendar =

  create: (element) ->
    options = FullCalendar.get_options(element)
    $(element).fullCalendar(options)
    $('#create_event').on 'click', (event) ->
      calendar = $(this).data('calendar')
      FullCalendar.Form.display($(calendar).data())
      event.preventDefault()

  get_options: (element) ->
    options = $(element).data()
    $.extend options,
      loading: (bool) ->
        if (bool)
          $('#loading').show()
        else
          $('#loading').hide()

      eventDrop: (event, delta, revertFunc) ->
        FullCalendar.Events.move(event, delta, revertFunc)

      eventResize: (event, delta, revertFunc) ->
        FullCalendar.Events.resize(event, delta, revertFunc)

      eventClick: (event, jsEvent, view) ->
        FullCalendar.Events.show(event)

      select: (start, end, jsEvent, view) ->
        FullCalendar.Form.display
          start_time:  start
          end_time:    end
          allDay:      !start.hasTime() && !end.hasTime()
          newEventUrl: view.options.newEventUrl
    options

  Events:

    send_request: (url, data, revertFunc) ->
      $.ajax
        url:      url
        data:     data
        dataType: 'script'
        type:     'post'
        error:    (xhr) ->
          revertFunc()

    prepare_data: (event, delta) ->
      event:
        day_delta: delta.days()
        hour_delta: delta.hours()
        minute_delta: delta.minutes()
        all_day: event.allDay
      authenticity_token: FullCalendar.Form.authenticity_token()

    move: (event, delta, revertFunc) ->
      url = event.path + "/move"
      data = FullCalendar.Events.prepare_data(event, delta)
      FullCalendar.Events.send_request(url, data, revertFunc)

    resize: (event, delta, revertFunc) ->
      url = event.path + "/resize"
      data = FullCalendar.Events.prepare_data(event, delta)
      FullCalendar.Events.send_request(url, data, revertFunc)

    show: (event) ->
      url = event.path + "/edit"
      $.get url, (data) ->
        $('#modal-holder').html(data).find('.modal').modal()

    toggle_period_and_frequency: (value) ->
      if value == 'no_repeat'
        $('#frequency').hide()
        $('#period').html('')
      else
        $('#period').html(value)
        $('#frequency').show()

  Form:

    display: (options) ->
      if typeof(options) == 'undefined'
        options = {}
      FullCalendar.Form.fetch(options)

    fetch: (options) ->
      $.get options.newEventUrl, (data) ->
        FullCalendar.Form.render(data, options)

    render: (data, options) ->
      $('#modal-holder').html(data)
      FullCalendar.Form.set_form_options(options)
      $('#modal-holder').find('.modal').modal()

    authenticity_token: ->
      return($('meta[name="csrf-token"]').attr("content"))

    set_form_options: (options) ->
      format    = options['datetimeFormat'] || 'DD/MM/YYYY HH:mm'
      startTime = (options['start_time']    || moment().floor(15, 'minutes')).format(format)
      endTime   = (options['end_time']      || moment().ceil(15, 'minutes')).format(format)
      allDay    = options['allDay']         || false
      $('#event_start_time').val(startTime)
      $('#event_end_time').val(endTime)
      $('#event_all_day').bootstrapSwitch('state', allDay)
