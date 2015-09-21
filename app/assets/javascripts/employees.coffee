# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $ ->

    $('input[type=checkbox]').on 'change', ->
      checkboxTarget = $(this).data('id')
      rangeField = $('#employee_' + checkboxTarget + '[type=text]')

      if this.checked == true
        rangeField.val('').prop('disabled', true).next().hide()
      else
        rangeField.prop('disabled', false).next().show()

  convert_to_time = (obj) ->
    time = obj / 60
    if(time < 12)
      meridian = 'AM'
    else
      meridian = 'PM'


    time = String(time)

    if(time.indexOf('.') > -1)
      time = time.replace('.5', ':30')
    else
      time = time.concat(':00')

    time = time.concat(' ' + meridian)

  $('.slider-range').slider
    range: true
    min: 0
    max: 1439
    step:30
    values: [
      0
      2400
    ]

    slide: (event, ui) ->
      startRange = convert_to_time(ui.values[0])
      endRange = convert_to_time(ui.values[1])

      sliderId = $(this).data('id')
      $('#employee_' + sliderId).val '' + startRange + ' - ' + endRange
      return
  $('#amount').val '' + $('.slider-range').slider('values', 0) + ' - ' + $('.slider-range').slider('values', 1)
  return


$(document).ready(ready)
$(document).on('page:load', ready)
