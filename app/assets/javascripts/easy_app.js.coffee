# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require jquery-ui/autocomplete
#= require jquery-ui/draggable
#= require jquery-ui/effect
#= require jquery-ui/effect-highlight
#= require jquery-ui/sortable
#= require jquery.minicolors
#= require autocomplete-rails
#= require bootstrap-sprockets
#= require bootstrap-switch
#= require bootstrap-markdown-bundle
#= require bootstrap-tagsinput
#= require moment
#= require fullcalendar
#= require fullcalendar/lang-all
#= require smart_listing
#= require zeroclipboard
#= require_tree .

root = exports ? this

# JQuery Datetimepicker compat
root.Date.parseDate = (input, format) ->
  $.fullCalendar.moment(input,format).toDate()

root.Date.prototype.dateFormat = (format) ->
  $.fullCalendar.moment(this).format(format)

beforeChange = ->
  ZeroClipboard.destroy()

onLoad = ->
  setAlertDismiss()
  contextMenuUnselectAll()

$(document).on('ready page:load', onLoad)
$(document).on('click', contextMenuClick)
$(document).on('contextmenu', contextMenuRightClick)
$(document).on('page:before-change', beforeChange)
