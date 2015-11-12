root = exports ? this

root.setModalBox = ->
  $('a[data-toggle="ajax-modal"]').on 'click', (event) ->
    event.preventDefault()
    draggable = $(this).data('draggable')
    size      = $(this).data('modal-size')
    $.get $(this).attr('href'), (data) ->
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
