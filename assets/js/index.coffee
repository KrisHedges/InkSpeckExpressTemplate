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

   # Here's where the Slide events are called
    $('sidebar ul li').bind "click", ->
      $('.back').addClass("show")
      fluidSlideLeft()
    $('.topbar').bind "click", ->
      $('.back').removeClass("show")
      fluidSlideRight()


  if navigator.userAgent.match /iPhone/i or navigator.userAgent.match /iPod/i
    forIphone()
