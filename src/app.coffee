
stage = require './stage'
Earth = require './models/Earth'
Particles = require './models/Particles'
Input = require './Input'
Loop = require './models/Loop'

$ ->

  # initialize stage
  stage.init()

  # define entities used on main stage
  entities =
    earth: new Earth()
    particles: new Particles()

  # add entities to stage
  for name, entity of entities
    stage.add entity

  # main loop
  gameLoop = new Loop
  gameLoop.use ->

    # update entities
    for name, entity of entities
      entity.tick()

    # repaint stage
    stage.getStage().update()

  gameLoop.play()

  # input controls
  input = new Input
  input.arrow_left_handler = () ->
  	console.log 'should rotate anticlockwise'
  input.arrow_right_handler = () ->
  	console.log 'should rotate clockwise'
