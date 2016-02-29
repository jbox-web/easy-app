root = exports ? this

# JQuery Datetimepicker compat
root.Date.parseDate = (input, format) ->
  $.fullCalendar.moment(input, format).toDate()

root.Date.prototype.dateFormat = (format) ->
  $.fullCalendar.moment(this).format(format)
