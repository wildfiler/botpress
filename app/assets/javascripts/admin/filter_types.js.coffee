jQuery ->
  $('form').on 'click', '.remove_filter_value',(event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.filter_value_field').hide()
    event.preventDefault()

  $('form').on 'click', '.add_field', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

