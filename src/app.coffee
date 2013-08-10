
stage = require './stage'
Earth = require './models/Earth'

$ ->
  stage.init()
  stage.add new Earth()
  stage.getStage().update()
