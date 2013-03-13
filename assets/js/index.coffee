$ ->
  if flui.touchable
    flui.scrollable $("#content")
    flui.scrollable $("#sidebar-list")
    $('.topbar').on 'touchmove', (e)->
      e.preventDefault()

  if flui.mobile
    $('sidebar ul li').tap ()->
      flui.carouselLeft($("#container"))
      $('.back').addClass("show")
    $('.back').tap ()->
      flui.carouselRight($("#container"))
      $('.back').removeClass("show")
