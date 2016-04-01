$ ->
  $('#promo_limit').inputmask 'integer', max: '100000', min: '0'
  $('#promo_sale').inputmask 'integer', max: '100000', min: '0'
  $('.Count').inputmask 'integer', max: '100000', min: '0'

  $("#new_promo").on "ajax:success", (e, data, status, xhr) ->
    $('.segment').dimmer('hide')
    $('.CompletedCount span').text(data.completed)
    $('.ui.modal').modal('show')

  $("#new_promo").on "ajax:error", (e, xhr, status, error) ->
    $("#new_promo").append "<p>ERROR</p>"

  $("#new_promo").on "ajax:send", (e) ->
    $('.segment').dimmer('show')

