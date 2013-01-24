$ ->
  $('.message').bind "click", ->
    $('.message').toggleClass("show")
  $('#send-message').bind "click", ->
    $('.message').toggleClass("show")


  forIphone = ->

    fluidSlideLeft = ()->
      $('#container').css 'left','-100%'
    fluidSlideRight = ()->
      $('#container').css 'left', '0%'

    watchOrientationChange = ->
      switch window.orientation
        when -0, 0
          window.scrollTo(0, 0)
    window.onorientationchange = ->
      watchOrientationChange()
    watchOrientationChange()

    $('sidebar ul li').bind "click", ->
      fluidSlideLeft()
    $('.topbar').bind "click", ->
      fluidSlideRight()

  if navigator.userAgent.match /iPhone/i or navigator.userAgent.match /iPod/i
    forIphone()
