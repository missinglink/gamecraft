
stage = require './stage'
Earth = require './models/Earth'
Particles = require './models/Particles'
Input = require './Input'
Loop = require './models/Loop'

$ ->
  left_pressed = false
  right_pressed = false

  # initialize stage
  stage.init()

  # define entities used on main stage
  entities =
    earth: new Earth()
    # particles: new Particles()

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
  input.arrow_left_down_handler = () ->
    console.log 'left down'
    left_pressed = true
  input.arrow_left_up_handler = () ->
    console.log 'left up'
    left_pressed = false
  input.arrow_right_down_handler = () ->
    console.log 'right down'
    right_pressed = true
  input.arrow_right_up_handler = () ->
    console.log 'right up'
    right_pressed = false
