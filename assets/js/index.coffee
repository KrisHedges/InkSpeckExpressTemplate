$ ->
  flui =
    slider: (el) ->
      el.get(0).addEventListener "input", ->
        value = $(this).val()
        left = value - 1
        margin = ((value / 3) * -1)
        if el.next().prop('tagName') is 'OUTPUT'
          output = el.next()
          output.css({
            left: "#{left}%"
            marginLeft:  "#{margin}px"
          }).val(value)

    carouselLeft: (el)->
      left = parseInt el.css('left')
      el.css 'left', "#{left - 100}%"

    carouselRight: (el)->
      left = parseInt el.css('left')
      el.css 'left', "#{left + 100}%"

    scrollable: (elem) ->
      elem = elem.get(0)
      if(!elem)
        return
      elem.addEventListener 'touchstart', (event)->
        startTopScroll = elem.scrollTop
        if startTopScroll <= 0
          elem.scrollTop = 1
        if startTopScroll + elem.offsetHeight >= elem.scrollHeight
          elem.scrollTop = elem.scrollHeight - elem.offsetHeight - 1
      , false

    init: ->
      sliders = $("input[type='range']")
      sliders.map ->
        flui.slider $(this)
  flui.init()

  iOS = false
  iPhone = false
  p = navigator.platform
  if (p == 'iPad') or (p == 'iPhone') or (p == 'iPod')
    iOS = true
  if (p == 'iPhone') or (p == 'iPod')
    iPhone = true

  forIos = ->
    $('html').removeClass('notouch')
    # -------------------
    # Touch Enabled Forms
    # -------------------
    txtinputs = $("select, textarea, input[type='text'], input[type='password'], input[type='number'], input[type='email'], input[type='url'], input[type='search'], input[type='tel'], input[type='date'], input[type='datetime'], input[type='datetime-local'], input[type='color']")

    txtinputs.map ->
      input = $(this)
      input.bind 'touchstart click', (e)->
        e.preventDefault()
      input.tap (e)->
        input.focus()
        e.preventDefault()

    $('label[for]').bind 'touchstart click', (e)->
      e.preventDefault()

    radios = $("input[type='radio']")
    radios.map ->
      radio = $(this)
      id = radio.prop 'id'
      $(this).bind 'touchstart click', (e)->
        $(this).prop('checked',false)
        e.preventDefault()
      $(this).tap (e)->
        $(this).prop 'checked',true
        e.preventDefault()
      $("label[for='#{id}']").tap (e)->
        radio.prop 'checked',true
        e.preventDefault()

    checkboxes = $("input[type='checkbox']")
    checkboxes.map ->
      chkbox = $(this)
      id = chkbox.prop 'id'
      chkbox.bind 'touchstart click', (e)->
        e.preventDefault()
      chkbox.tap (e)->
        checked = chkbox.prop 'checked'
        if checked == true
          chkbox.prop 'checked',false
        else
          chkbox.prop 'checked', true
        e.preventDefault()
      $("label[for='#{id}']").tap (e)->
        checked = chkbox.prop 'checked'
        if checked == true
          chkbox.prop 'checked',false
        else
          chkbox.prop 'checked', true
        e.preventDefault()

    adjustOrientationChange = ->
      switch window.orientation
        when -0, 0
          window.scrollTo(0, 1)
    adjustOrientationChange()

    window.onorientationchange = ->
      adjustOrientationChange()

  if iOS
    forIos()
    flui.scrollable $("#content")
    flui.scrollable $("#sidebar-list")
    $('.topbar').on 'touchmove', (e)->
      e.preventDefault()

  if iPhone
    $('sidebar ul li').tap ()->
      flui.carouselLeft($("#container"))
      $('.back').addClass("show")

    $('.back').tap ()->
      flui.carouselRight($("#container"))
      $('.back').removeClass("show")
