
win = $ window
el = null

size = width: 0, height: 0
stage = null

module.exports =

  init: ->
    el = $ '#game-stage'
    size.width = win.width()
    size.height = win.height()
    el.css size
    el.attr size
    stage = new createjs.Stage el[0]

  getStage: -> stage

  geetSize: -> size
