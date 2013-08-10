
stage = require './stage'
Earth = require './models/Earth'

$ ->
  stage.init()
  stage.getStage().addChild new Earth()
  stage.getStage().update()
