$ ->
  $("#new_promo").on "ajax:success", (e, data, status, xhr) ->
    console.log e
    console.log data
    console.log xhr
    console.log status
    $('.segment').dimmer('hide')
    $('.ui.modal')
      .modal('show')
    $('.CompletedCount span').text(data.completed)

  $("#new_promo").on "ajax:error", (e, xhr, status, error) ->
    $("#new_promo").append "<p>ERROR</p>"

  $("#new_promo").on "ajax:send", (e) ->
    $('.segment').dimmer('show')

