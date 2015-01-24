# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".page-scroll a").bind "click", (event) ->
    $anchor = $(this)
    $("html, body").stop().animate
      scrollTop: $($anchor.attr("href")).offset().top
    , 1500, "easeInOutExpo"
    event.preventDefault()
    return

  return
$(window).scroll ->
  if $(".navbar").offset().top > 50
    $(".navbar-brand").removeClass("hide")
    $(".navbar-fixed-top").addClass "top-nav-collapse"
  else
    $(".navbar-brand").addClass("hide").fadeIn(350)
    $(".navbar-fixed-top").removeClass "top-nav-collapse"

