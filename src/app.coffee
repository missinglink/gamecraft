
stage = require './stage'
Earth = require './models/Earth'
Particles = require './models/Particles'
Input = require './Input'
Loop = require './models/Loop'
controls = require './controls'

$ ->
  left_pressed = false
  right_pressed = false

  # initialize stage
  stage.init()

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
  moving = false

  input.arrowLeftDownHandler = -> 
    if not moving
      controls.setDirection -1
      moving = true
  input.arrowRightDownHandler = -> 
    if not moving
      controls.setDirection 1
      moving = true

  input.arrowLeftUpHandler = -> 
    controls.setDirection 0
    moving = false
  input.arrowRightUpHandler = -> 
    controls.setDirection 0
    moving = false
