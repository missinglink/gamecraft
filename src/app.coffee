
stage = require './stage'
Earth = require './models/Earth'
Particles = require './models/Particles'
Input = require './Input'
Loop = require './models/Loop'
controls = require './controls'
status = require './status'

$ ->
  left_pressed = false
  right_pressed = false

  # initialize stage
  stage.init()

  # initialise status (life)
  status.init()

  # define entities used on main stage
  entities =
    earth: new Earth()
    particles1: new Particles()
    particles2: new Particles()
    particles3: new Particles()
    particles4: new Particles()
    particles5: new Particles()

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

  input.arrow_left_down_handler = -> controls.setDirection -1
  input.arrow_right_down_handler = -> controls.setDirection 1

  input.arrow_left_up_handler = -> controls.setDirection 0
  input.arrow_right_up_handler = -> controls.setDirection 0
