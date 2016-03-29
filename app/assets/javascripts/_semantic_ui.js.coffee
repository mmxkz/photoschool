$ ->
  $('.ui.dropdown').dropdown()
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
