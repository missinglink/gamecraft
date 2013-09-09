
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'
Gravity = require '../physics/Gravity'
Thrust = require '../physics/Thrust'
Tail = require './Tail'
geometry = require '../helpers/geometry'

earthRadius = 100

class Orbiter extends Entity

  constructor: (@options, @thrust_speed = 3, thrust_angle = 90) ->
    super()

    # @rotationAngle = 0
    while not @rotationAngle? or @rotationAngle is 0
      @rotationAngle = Math.round( Math.random() * 1 )-0.5
    
    @thrust = new Thrust (translate.screen @thrust_speed), thrust_angle
    @gravity = new Gravity 10, 0, 0
    @tail = new Tail()
    @stage.addChild @tail.stage

    @status = 0

    setInterval ( => if @status > 0 then @tail.tick @particle ), 50

  render: ->

    @x = 0
    @y = 0

    @particle = new createjs.Bitmap "img/data-#{@options.asset}.png"
    @particle.loaded = false

    @particle.scaleX = translate.screen .5
    @particle.scaleY = translate.screen .5

    @particle.x = 0
    @particle.y = 0
    @particle.image.onload = => @particle.loaded = true

    @particle.alpha = 0

    @stage.addChild @particle

  tick: ->
    super()
    @thrust.setSpeed @thrust_speed

    @thrust.setSpeed( @thrust.speed-0.01 )
    @thrust.setAngle( @thrust.angle+@rotationAngle )

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    # @gravity.tick @particle
    @thrust.tick @particle

    origin = x: 0, y: 0
    x = translate.world @particle.x
    y = translate.world @particle.y
    distance = geometry.getDistance origin, x: x, y: y
    
    if @status is 0 and distance > earthRadius
      @particle.alpha = 1
      @status = 1

    if @status is 1 and distance < earthRadius
      @status = 2
      console.log 'HIT'
      angle = Math.atan2 -@particle.y, -@particle.x
      angle = geometry.radToDeg angle
      (_ @).emit 'hit', [ angle, @particle ]
      @particle.alpha = 0

module.exports = Orbiter
