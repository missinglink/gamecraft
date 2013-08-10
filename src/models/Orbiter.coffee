
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'

# class Gravity

#   constructor: ( @pull, @x, @y ) -> null

#   updateAngle: ( particle ) =>
#     deltaY = @y - particle.y
#     deltaX = @x - particle.x
#     gravity_degrees = Math.atan2( deltaY, deltaX ) * 180 / Math.PI
#     @angle = Math.atan2( deltaY, deltaX ) * 180 / Math.PI

#   tick: ( particle ) =>

#     @updateAngle particle

#     # if gravity_degrees < 0 then gravity_degrees = 360+gravity_degrees
#     # console.log gravity_degrees

#     particle.x += @pull * Math.cos @angle
#     particle.y += @pull * Math.sin @angle


class Thrust

  constructor: ( @speed, @angle ) -> null
  setSpeed: ( @speed ) => null
  setAngle: ( @angle ) =>
    if @angle > 360 then @angle = @angle-360
    else if @angle <= 0 then @angle = 360+@angle
    console.log 'angle', @angle

  tick: ( particle ) =>

    particle.x -= @speed * Math.sin @angle * Math.PI / 180
    particle.y -= @speed * Math.cos @angle * Math.PI / 180
    # particle.x -= @speed
    # particle.y -= @speed
    particle.rotation = Math.round @angle
    # particle.x += @speed




class Orbiter extends Entity

  constructor: ->

    @x = 0
    @y = 0
    @radius = 5

    @particle = new createjs.Bitmap 'http://www.someicons.com/desktop-icons-games/donkey-kong-msl/Banana.gif'
    @particle.loaded = false
    @particle.rotation = 0
    @particle.x = 0
    @particle.y = 0
    @particle.image.onload = => @particle.loaded = true

    # @trajectory = speed: 2, angle: 90
    # @gravity = new Gravity 2, 0, 0
    @thrust = new Thrust 2, 45

    super

    @stage.addChild @particle

  tick: ->

    @thrust.setAngle( @thrust.angle+1 )

    # console.log @trajectory.angle

    # @trajectory.angle -= 1
    # if @trajectory.angle < 0 then @trajectory.angle = 360 - @trajectory.angle
    # else if @trajectory.angle > 360 then @trajectory.angle -= 360

    # @trajectory.speed -= .01
    # if @trajectory.speed < 0 then @trajectory.speed = 0

    # @trajectory.speed += @trajectory.acceleration

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    # @trajectory.angle += ( Math.round( Math.random() * @maxRotate * 2 ) - @maxRotate )

    # @trajectory.speed -= .01
    # if @trajectory.speed < 0 then @trajectory.speed = 0

    # @particle.x += @trajectory.speed * Math.cos Math.round @trajectory.angle
    # @particle.y += @trajectory.speed * Math.sin Math.round @trajectory.angle
    # @particle.rotation = Math.round @trajectory.angle

    # apply gravity
    # @gravity.tick @particle
    @thrust.tick @particle

    # dest = new Gravity @trajectory.speed, 200, 200
    # dest.tick @particle

    

  render: ->

    # @stage.x = translate.x 0
    # @stage.y = translate.y 0

    # @particle = new createjs.Shape()
    # @particle.graphics.beginFill('blue').drawCircle 0, 0, translate.screen @radius
    # @stage.addChild @particle

module.exports = Orbiter