$ ->
  $('.typeSaleDropdown').dropdown
    onChange: ->
      $('#promo_sale').val('')

      if $('#promo_type_sale').val() == 'fixed'
        $('#promo_sale').inputmask 'integer', max: '100000', min: '0'
      else
        $('#promo_sale').inputmask 'integer', max: '100', min: '0'

  $('.ui.checkbox').checkbox()
  $('.ui.form').form
    on: 'blur'
    inline: true
    fields:
      'purchase[price]':
        identifier: 'purchase[price]'
        rules: [ {
          type: 'empty'
          prompt: 'Укажите цену'
        } ]
      'purchase[description]':
        identifier: 'purchase[description]'
        rules: [ {
          type: 'empty'
          prompt: 'Заполните описание'
        } ]
