
stage = require './stage'
Earth = require './models/Earth'
Particles = require './models/Particles'
Loop = require './models/Loop'

$ ->
  stage.init()

  objects = {
    earth: new Earth()
    particles: new Particles()
  }

  for name, object of objects
    stage.add object

  gameLoop = new Loop

  gameLoop.use ->

    for name, object of objects
      object.tick()

    stage.getStage().update()

  gameLoop.play()
