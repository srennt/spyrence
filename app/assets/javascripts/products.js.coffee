# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
$("#stripe_checkout_button").on("ajax:success", (e, data, status, xhr) ->
    $("#stripe_checkout_button").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#stripe_checkout_button").append "<p>ERROR</p>"   
