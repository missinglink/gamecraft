
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'
# Gravity = require '../physics/Gravity'
Thrust = require '../physics/Thrust'

spinSpeed = 200

class Orbiter extends Entity 

  constructor: ( thrust_speed=3, thrust_angle=90 ) ->
    super()
    # @gravity = new Gravity (translate.screen 2), 0, 0
    @thrust = new Thrust (translate.screen thrust_speed), thrust_angle

  tick: ->

    # @thrust.setSpeed( @thrust.speed-0.01 )
    @thrust.setAngle( @thrust.angle+1 )

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    # @gravity.tick @particle
    @thrust.tick @particle

  render: ->

    @x = 0
    @y = 0

    @particle = new createjs.Bitmap 'img/data-email.png'
    @particle.loaded = false

    @particle.scaleX = translate.screen .5
    @particle.scaleY = translate.screen .5

    @particle.x = 0
    @particle.y = 0
    @particle.image.onload = => @particle.loaded = true

    super

    @stage.addChild @particle

  tick: ->
    super

    @thrust.setSpeed translate.screen( spinSpeed * @lastFrameLength / 1000 )

    # @thrust.setSpeed( @thrust.speed-0.01 )
    @thrust.setAngle( @thrust.angle+1 )

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    # @gravity.tick @particle
    @thrust.tick @particle

module.exports = Orbiter