$('[data-toggle=\'buttons\'] .btn').each (i, el) ->
  $button = $(el)
  checked = $button.find('input[type=\'checkbox\']').prop('checked')
  if checked
    $button.addClass 'active'
  else
    $button.removeClass 'active'
  return
