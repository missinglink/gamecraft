
stage = require './stage'
Earth = require './models/Earth'
Loop = require './models/Loop'

$ ->
  stage.init()
  stage.add new Earth()
  gameLoop = new Loop
  gameLoop.use -> stage.getStage().update()
  gameLoop.play()
