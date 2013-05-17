$ ->
  #Setup
  flui.hide $('.back'), 0
  flui.show $('.leftmenu')
  flui.show $('.rightmenu')
  main = $('#container')

  #Clicks
  if not flui.touchable
    $('.leftmenu').on 'click', (e)->
      e.preventDefault()
      flui.flyAwayMenu($("#leftslidemenu"), main, 'left')

    $('.rightmenu').on 'click', (e)->
      e.preventDefault()
      flui.flyInMenu($("#rightslidemenu"), 'right')

  # Touches
  if flui.touchable
    flui.inscrollable $('.topbar')
    flui.scrollable $("#content")
    flui.scrollable $("#sidebar-list")
    flui.scrollable $("#leftslidemenu ul")
    flui.scrollable $("#rightslidemenu ul")

    $('sidebar ul li').tap ->
      flui.hide $('.leftmenu'), 300
      flui.lCarousel(main)
      flui.show $('.back')

    $('.back').tap ->
      flui.hide $('.back'), 300
      flui.rCarousel(main)
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
