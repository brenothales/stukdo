@notice = (element, color) ->
  element.animate {backgroundColor: color}, 800
  element.animate {backgroundColor: "#fff"}, 800

@toggable = (parent) ->
  parent.find('.show-logs').on 'click', ->
    $(this).parents('.subtask:first').find('.subtask-logs').toggle 'slow'

$ ->
  for subtask in $('.subtask')
    toggable $(subtask)
