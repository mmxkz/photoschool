$ ->
  $("#new_purchase").on "ajax:success", (e, data, status, xhr) ->
    $('.PurchaseCompleted').modal('show')

  $("#new_purchase").on "ajax:error", (e, xhr, status, error) ->
    $("#new_purchase").append "<p>ERROR</p>"
