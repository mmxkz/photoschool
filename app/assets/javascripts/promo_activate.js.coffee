$ ->
  $('#purchase_price').inputmask 'integer', max: '1000000', min: '0'

  $("#purchase_price").change ->
    price = $(@).val()
    if price
      console.log price
      $('.PromoField').show()
      $('.SummaryPrice span').text(price)
    else
      $('.PromoField').hide()

  $('.PromoActivateButton').click ->
    code = $('#PromoCode').val()
    $.ajax
      format: 'json'
      url : "/promo/find"
      dataType : 'json'
      data: {promocode: code}
      success: (data) ->
        price = $("#purchase_price").val()
        switch data.type_sale
          when 'percent'
            $('.SummaryPrice span').text(price * (100 - data.sale)/100)
          when 'fixed'
            total_amount = if (price - data.sale) > 0 then (price - data.sale) else 0
            $('.SummaryPrice span').text(total_amount)
        $("#promo_id").val(data.id)
        $(".PromoError").hide()
      error: (error) =>
        $(".PromoError span").text(error.responseJSON.error)
        $(".PromoError").show()
