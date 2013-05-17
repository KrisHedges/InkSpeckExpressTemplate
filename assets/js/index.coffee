$ ->
  #Setup
  flui.hide $('.back')
  main = $('#container')

  #Clicks
  if not flui.touchable
    $('.leftmenu').on 'click', (e)->
      e.preventDefault()
      flui.flyAwayMenu($("#leftslidemenu"), main, 'left')

    $('.rightmenu').on 'click', (e)->
      e.preventDefault()
      flui.flyInMenu($("#rightslidemenu"), 'right')

    $('sidebar ul li').click ()->
      flui.lCarousel(main)
      flui.hide $('.leftmenu'), 0
      flui.show $('.back')

    $('.back').click ()->
      flui.rCarousel(main)
      flui.hide $('.back'), 0
      flui.show $('.leftmenu')

  # Touches
  if flui.touchable
    flui.inscrollable $('.topbar')
    flui.scrollable $("#content")
    flui.scrollable $("#sidebar-list")
    flui.scrollable $("#leftslidemenu ul")
    flui.scrollable $("#rightslidemenu ul")

    $('sidebar ul li').on 'tap', ->
      flui.lCarousel(main)
      flui.hide $('.leftmenu'), 0
      flui.show $('.back')

    $('.back').on 'tap', ->
      flui.rCarousel(main)
      flui.hide $('.back'), 0
      flui.show $('.leftmenu')

    $('.leftmenu').on 'tap', (e)->
      e.preventDefault()
      flui.flyAwayMenu($("#leftslidemenu"), main, 'left')
    $("#leftslidemenu").swipeLeft ->
      flui.flyAwayMenu($("#leftslidemenu"), main, 'left')

    $('.rightmenu').tap (e)->
      e.preventDefault()
      flui.flyInMenu($("#rightslidemenu"), 'right')
    $("#rightslidemenu").swipeRight ->
      flui.flyInMenu($("#rightslidemenu"), 'right')
