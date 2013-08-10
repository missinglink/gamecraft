
stage = require './stage'
Earth = require './models/Earth'
Particles = require './models/Particles'
Orbiter = require './models/Orbiter'
Input = require './Input'
Loop = require './models/Loop'
controls = require './controls'
status = require './status'
GameModel = require './models/GameModel'

$ ->
  left_pressed = false
  right_pressed = false

  # initialize stage
  stage.init()

  # initialise status (life)
  status.init()

  gameModel = new GameModel()

  # define entities used on main stage
  entities =
    earth: new Earth()
    orbiter1: new Orbiter()
    orbiter2: new Orbiter( 0, 3, 0 )
    orbiter3: new Orbiter( 1, 5, 45 )
    orbiter4: new Orbiter( 2, 4, 90 )
    orbiter5: new Orbiter( 0, 3, 135 )
    orbiter6: new Orbiter( 1, 5, 180 )
    orbiter7: new Orbiter( 0, 4, 225 )
    orbiter8: new Orbiter( 2, 3, 270 )
    orbiter9: new Orbiter( 0, 5, 315 )
    # orbiter4: new Orbiter()
    # particles1: new Particles()

  # add entities to stage
  for name, entity of entities
    stage.add entity

  # main loop
  gameLoop = new Loop
  gameLoop.use ->

    timeDelta = gameLoop.getTimeDelta()
    gameModel.tick(timeDelta)

    newValue = gameModel.timeLeft / gameModel.duration * 100
    status.setLife newValue

    # update entities
    for name, entity of entities
      entity.tick()

    # repaint stage
    stage.getStage().update()

    # if gameModel.isGameOver()
      # alert 'GAME FUCKING OVER!'
      # gameLoop.pause()

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
