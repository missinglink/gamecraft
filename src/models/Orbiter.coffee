
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'
# Gravity = require '../physics/Gravity'
Thrust = require '../physics/Thrust'

levels = [
    { asset: 'email' }
    { asset: 'key' }
    { asset: 'upload' }
]

class Orbiter extends Entity

  constructor: ( @level = 0, thrust_speed = 3, thrust_angle = 90 ) ->
    super()
    @cooef = Math.round( Math.random() * 4 )-2
    
    @thrust = new Thrust (translate.screen thrust_speed), thrust_angle
    @spinSpeed = 30 * thrust_speed

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

    assetName = levels[@level].asset
    @particle = new createjs.Bitmap "img/data-#{assetName}.png"
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

    @thrust.setSpeed translate.screen( @spinSpeed * @lastFrameLength / 1000 )

    # @thrust.setSpeed( @thrust.speed-0.01 )
    @thrust.setAngle( @thrust.angle+@cooef )

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    # @gravity.tick @particle
    @thrust.tick @particle

module.exports = Orbiter