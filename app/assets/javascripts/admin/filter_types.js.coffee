jQuery ->
  $('form').on 'click', '.remove_filter_value',(event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.filter_value_field').hide()
    event.preventDefault()
