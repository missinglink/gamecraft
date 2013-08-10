
window.onload = (e) ->

  stage = require './stage'
  Earth = require './models/Earth'

  stage.addChild new Earth()
  stage.update()
