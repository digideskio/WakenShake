NewsTickerAutoPlay = ->
  $('.NewsTicker li:first-child').fadeOut ->
    $(this).appendTo('.NewsTicker').fadeIn()
    return
  return

setInterval (->
  NewsTickerAutoPlay()
  return
), 4000
