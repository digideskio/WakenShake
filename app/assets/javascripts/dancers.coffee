ready = ->
  $('[data-toggle=\'buttons\'] .btn').each (i, el) ->
    $button = $(el)
    checked = $button.find('input[type=\'radio\']').prop('checked')
    if checked
      $button.addClass 'active'
    else
      $button.removeClass 'active'
    return

$(document).ready(ready)
$(document).on('page:load', ready)
