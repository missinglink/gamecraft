
stage = require './stage'
Earth = require './models/Earth'
Loop = require './models/Loop'

$ ->
  stage.init()

  objects = {
    earth: new Earth()
  }

  stage.add objects.earth
  gameLoop = new Loop
  gameLoop.use ->
    objects.earth.render()
    stage.getStage().update()
  gameLoop.play()
