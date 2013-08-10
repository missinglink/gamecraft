
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'
Gravity = require '../physics/Gravity'
Thrust = require '../physics/Thrust'
Tail = require './Tail'

class Orbiter extends Entity

  constructor: (@options, thrust_speed = 3, thrust_angle = 90) ->
    super()

    # @rotationAngle = 0
    while not @rotationAngle? or @rotationAngle is 0
      @rotationAngle = Math.round( Math.random() * 1 )-0.5
    
    @thrust = new Thrust (translate.screen thrust_speed), thrust_angle
    @gravity = new Gravity 10, 0, 0
    @tail = new Tail()
    @stage.addChild @tail.stage

    @spinSpeed = 30 * thrust_speed

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

    @stage.addChild @particle

  tick: ->
    super()
    @thrust.setSpeed translate.screen( @spinSpeed * @lastFrameLength / 1000 )

    # @thrust.setSpeed( @thrust.speed-0.01 )
    @thrust.setAngle( @thrust.angle+@rotationAngle )

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    # @gravity.tick @particle
    @thrust.tick @particle
    if Math.random() > 0.9 then @tail.tick @particle

module.exports = Orbiter