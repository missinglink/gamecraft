
stage = require './stage'
Earth = require './models/Earth'
Input = require './Input'

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

  input = new Input
  input.arrow_left_handler = () ->
  	console.log 'should rotate anticlockwise'
  input.arrow_right_handler = () ->
  	console.log 'should rotate clockwise'
