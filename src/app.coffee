
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

    for name, object of objects
      object.tick()

    stage.getStage().update()

  gameLoop.play()
