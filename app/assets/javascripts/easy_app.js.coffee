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
#= require jquery-ui/datepicker
#= require jquery-ui/datepicker-fr
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
#= require fullcalendar/events
#= require smart_listing
#= require zeroclipboard
#= require chartkick/0-highcharts
#= require chartkick/1-highcharts-map
#= require chartkick/2-chartkick
#= require datatable/datatables
#= require datatable/datatables_helper
#= require datatable/jquery.dataTables.yadcf
#= require datetimepicker/easy_app_datetimepicker_patch
#= require datetimepicker/easy_app_moment-round
#= require datetimepicker/jquery.datetimepicker
#= require select2/select2.full
#= require_tree .

onLoad = ->
  setAlertDismiss()

$(document).on('ready', onLoad)
