$ ->
  if flui.touchable
    flui.scrollable $("#content")
    flui.scrollable $("#sidebar-list")
    flui.inscrollable $('.topbar')

  if flui.mobile
    $('sidebar ul li').tap ()->
      flui.horizontalLeft($("#container"))
      $('.back').addClass("show")
    $('.back').tap ()->
      flui.horizontalRight($("#container"))
      $('.back').removeClass("show")
