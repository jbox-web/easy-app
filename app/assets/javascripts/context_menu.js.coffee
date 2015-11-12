root = exports ? this

root.contextMenuRightClick = (event) ->
  target = $(event.target)
  return if target.is('a')
  tr = target.parents('tr').first()
  return if !tr.hasClass('has-context-menu')
  event.preventDefault()
  if (!contextMenuIsSelected(tr))
    contextMenuUnselectAll()
    contextMenuAddSelection(tr)
    contextMenuSetLastSelected(tr)
  contextMenuShow(event)


root.contextMenuClick = (event) ->
  target = $(event.target)
  lastSelected = null

  if (target.is('a') && target.hasClass('submenu'))
    event.preventDefault()
    return

  contextMenuHide()

  return if target.is('a') || target.is('img')

  if event.which == 1 || navigator.appVersion.match(/\bMSIE\b/)
    tr = target.parents('tr').first()
    if tr.length && tr.hasClass('has-context-menu')
      # a row was clicked, check if the click was on checkbox
      if target.is('input')
        # a checkbox may be clicked
        if target.prop('checked')
          tr.addClass('context-menu-selection')
        else
          tr.removeClass('context-menu-selection')
      else
        if event.ctrlKey || event.metaKey
          contextMenuToggleSelection(tr)
        else if event.shiftKey
          lastSelected = contextMenuLastSelected()
          if lastSelected.length
            toggling = false
            $('.has-context-menu').each ->
              if toggling || $(this).is(tr)
                contextMenuAddSelection($(this))
              if $(this).is(tr) || $(this).is(lastSelected)
                toggling = !toggling
          else
            contextMenuAddSelection(tr)
        else
          contextMenuUnselectAll()
          contextMenuAddSelection(tr)
        contextMenuSetLastSelected(tr);

    else
      # click is outside the rows
      if target.is('a') && (target.hasClass('disabled') || target.hasClass('submenu'))
        event.preventDefault()
      else
        contextMenuUnselectAll()


root.contextMenuShow = (event) ->
  mouse_x       = event.pageX
  mouse_y       = event.pageY
  render_x      = mouse_x
  render_y      = mouse_y
  dims          = null
  menu_width    = null
  menu_height   = null
  window_width  = null
  window_height = null
  max_width     = null
  max_height    = null

  $('#context-menu').css('left', (render_x + 'px'))
  $('#context-menu').css('top', (render_y + 'px'))
  $('#context-menu').html('')

  $.ajax {
    url: $(event.target).parents('tbody').first().data('url'),
    data: $(event.target).parents('form').first().serialize(),
    success: (data, textStatus, jqXHR) ->
      $('#context-menu').html(data)
      menu_width = $('#context-menu').width()
      menu_height = $('#context-menu').height()
      max_width = mouse_x + 2 * menu_width
      max_height = mouse_y + menu_height

      ws = window_size()
      window_width = ws.width
      window_height = ws.height

      # display the menu above and/or to the left of the click if needed
      if max_width > window_width
        render_x -= menu_width
        $('#context-menu').addClass('reverse-x')
      else
        $('#context-menu').removeClass('reverse-x')

      if max_height > window_height
        render_y -= menu_height
        $('#context-menu').addClass('reverse-y')
      else
        $('#context-menu').removeClass('reverse-y')

      render_x = 1 if render_x <= 0
      render_y = 1 if render_y <= 0
      $('#context-menu').css('left', (render_x + 'px'))
      $('#context-menu').css('top', (render_y + 'px'))
      $('#context-menu').show()
  }


root.contextMenuSetLastSelected = (tr) ->
  $('.cm-last').removeClass('cm-last')
  tr.addClass('cm-last')


root.contextMenuLastSelected = ->
  return $('.cm-last').first()


root.contextMenuUnselectAll = ->
  $('.has-context-menu').each ->
    contextMenuRemoveSelection($(this))
  $('.cm-last').removeClass('cm-last')


root.contextMenuHide = ->
  $('#context-menu').hide()


root.contextMenuToggleSelection = (tr) ->
  if (contextMenuIsSelected(tr))
    contextMenuRemoveSelection(tr)
  else
    contextMenuAddSelection(tr)


root.contextMenuAddSelection = (tr) ->
  tr.addClass('context-menu-selection')
  contextMenuCheckSelectionBox(tr, true)


root.contextMenuRemoveSelection = (tr) ->
  tr.removeClass('context-menu-selection')
  contextMenuCheckSelectionBox(tr, false)


root.contextMenuIsSelected = (tr) ->
  return tr.hasClass('context-menu-selection')


root.contextMenuCheckSelectionBox = (tr, checked) ->
  tr.find('input[type=checkbox]').prop('checked', checked)


root.window_size = ->
  w = null
  h = null
  if window.innerWidth
    w = window.innerWidth
    h = window.innerHeight
  else if document.documentElement
    w = document.documentElement.clientWidth
    h = document.documentElement.clientHeight
  else
    w = document.body.clientWidth
    h = document.body.clientHeight

  return { width: w, height: h }
