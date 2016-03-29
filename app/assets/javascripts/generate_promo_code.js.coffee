$ ->
  $("#new_promo").on "ajax:success", (e, data, status, xhr) ->
    $('.segment').dimmer('hide')
    $('.CompletedCount span').text(data.completed)
    $('.ui.modal').modal('show')

  $("#new_promo").on "ajax:error", (e, xhr, status, error) ->
    $("#new_promo").append "<p>ERROR</p>"

  $("#new_promo").on "ajax:send", (e) ->
    $('.segment').dimmer('show')

