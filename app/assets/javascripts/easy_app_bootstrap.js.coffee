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


root.toggleCheckboxes = (element, selector) ->
  all_checked = $(element).is(':checked')
  $(selector).each ->
    $(this).prop('checked', all_checked)
    if all_checked == true
      $(this).parent().parent().addClass('selected')
    else
      $(this).parent().parent().removeClass('selected')


root.setContextualMenuForRow = (row) ->
  $(row).addClass('has-context-menu')


root.setBootstrapRowStatus = (row) ->
  status = $(row).find('td.status').html()
  if status == '1'
    $(row).addClass('success')
  else if status == '2'
    $(row).addClass('warning')
  else if status == '3'
    $(row).addClass('danger')


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
