root = exports ? this

root.openModalBox = (event, element) ->
  event.preventDefault()
  draggable = $(element).data('draggable')
  size      = $(element).data('modal-size')
  $.get $(element).attr('href'), (data) ->
    if draggable
      $('#modal-holder').html(data).find('.modal').modal().draggable()
    else
      $('#modal-holder').html(data).find('.modal').modal()
    if size
      $('.modal-dialog').addClass('modal-' + size)
  return false


root.createBootstrapSwitch = (element) ->
  callback = $(element).data('switch-callback')
  if callback
    $(element).bootstrapSwitch(onSwitchChange: (event, checked) -> eval(callback))
  else
    $(element).bootstrapSwitch()


root.toggleElement = (event, checked, element) ->
  if (checked)
    $(element).show()
  else
    $(element).hide()


root.highlight = (element) ->
  $(element).effect('highlight', { color: '#B0D6D6' }, 1500)


root.toggleBooleanIcon = (element) ->
  icon = $(element)
  if icon.hasClass('fa-times')
    icon.removeClass('fa-times')
    icon.removeClass('fa-important')
    icon.addClass('fa-check')
    icon.addClass('fa-success')
  else
    icon.removeClass('fa-check')
    icon.removeClass('fa-success')
    icon.addClass('fa-times')
    icon.addClass('fa-important')


root.toggleCheckboxes = (element, selector) ->
  all_checked = $(element).is(':checked')
  $(selector).each ->
    $(this).prop('checked', all_checked)
    if all_checked == true
      $(this).parent().parent().addClass('selected')
    else
      $(this).parent().parent().removeClass('selected')


root.setZeroClipBoard = (element) ->
  # Create ZeroClipboard object
  client = new ZeroClipboard($(element))

  client.on 'ready', ->
    $('#global-zeroclipboard-html-bridge').tooltip
      title: $(element).data('label-to-copy')
      placement: 'right'

    client.on 'beforecopy', -> $('#global-zeroclipboard-html-bridge').tooltip('show')
    client.on 'aftercopy',  -> $('.tooltip .tooltip-inner').text($(element).data('label-copied'))


root.setAlertDismiss = ->
  $('.alert:not(.dont-dismiss)').delay(3000).slideUp(200, -> $(this).alert('close'))
