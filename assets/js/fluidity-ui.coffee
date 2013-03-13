$ ->
  touchable = false
  mobile = false

  initTouch = ->
    p = navigator.platform
    if (p == 'iPad') or (p == 'iPhone') or (p == 'iPod')
      touchable = true
    if (p == 'iPhone') or (p == 'iPod')
      mobile = true
  initTouch()

  window.flui =
    touchable: touchable
    mobile: mobile

    slider: (el) ->
      el.bind 'change', ->
        value = $(this).val()
        width = el.width()
        newPoint = (el.val() - el.attr("min")) / (el.attr("max") - el.attr("min"))
        if el.next().prop('tagName') is 'OUTPUT'
          output = el.next("output")
          owidth = output.width()
          if newPoint < 0
            newPlace = 0
          else if newPoint > 1
            newPlace = width
          else
            offset = newPoint * (owidth/width)
            newPlace = newPoint - offset
          output.css({
            left: (newPlace * 100) + "%"
          }).val(value)

    initSliders: ->
      sliders = $("input[type='range']")
      sliders.map ->
        flui.slider $(this)

    carouselLeft: (el)->
      left = parseInt el.css('left')
      el.css 'left', "#{left - 100}%"

    carouselRight: (el)->
      left = parseInt el.css('left')
      el.css 'left', "#{left + 100}%"

    scrollable: (el) ->
      el = el.get(0)
      if(!el)
        return
      el.addEventListener 'touchstart', ->
        startTopScroll = el.scrollTop
        if startTopScroll <= 0
          el.scrollTop = 1
        if startTopScroll + el.offsetHeight >= el.scrollHeight
          el.scrollTop = el.scrollHeight - el.offsetHeight - 1
      , false

    orientable: ->
      if mobile
        adjustOrientationChange = ->
          switch window.orientation
            when -0, 0
              window.scrollTo(0, 1)
        adjustOrientationChange()

        window.onorientationchange = ->
          adjustOrientationChange()

    # -------------------
    # Touch Enabled Forms
    # -------------------
    touchableForms: ->
      if touchable
        $('html').removeClass('notouch')

        txtinputs = $("select, textarea, input[type='text'], input[type='password'], input[type='number'], input[type='email'], input[type='url'], input[type='search'], input[type='tel'], input[type='date'], input[type='datetime'], input[type='datetime-local'], input[type='color']")

        txtinputs.map ->
          input = $(this)
          input.bind 'touchstart', (e)->
            e.preventDefault()
          input.tap (e)->
            input.focus()
            e.preventDefault()

        $('label[for]').bind 'touchstart', (e)->
          e.preventDefault()

        radios = $("input[type='radio']")
        radios.map ->
          radio = $(this)
          id = radio.prop 'id'
          $(this).bind 'touchstart', (e)->
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
          chkbox.bind 'touchstart', (e)->
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

    init: ->
      flui.orientable()
      flui.touchableForms()
      flui.initSliders()
  flui.init()
