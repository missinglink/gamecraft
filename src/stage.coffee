
device = require './device'
translate = require './translate'

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

    # if device.isRetina()
    #   el.attr width: size.width * 2, height: size.height * 2
    #   translate.setRatio 2

    stage = new createjs.Stage el[0]

  add: (entity) -> stage.addChild entity.stage

  getStage: -> stage

  getSize: -> size
