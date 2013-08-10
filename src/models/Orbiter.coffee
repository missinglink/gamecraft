
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'

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

    @trajectory = speed: 5, angle: 90
    @gravity = force: 3, center: x: 0, y: 0
    
    super

  tick: ->

    # console.log @trajectory.angle

    @trajectory.speed -= .01
    if @trajectory.speed < 0 then @trajectory.speed = 0

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    # @trajectory.angle += ( Math.round( Math.random() * @maxRotate * 2 ) - @maxRotate )

    # @trajectory.speed -= .001
    # if @trajectory.speed < 0 then @trajectory.speed = 0


    @particle.x += @trajectory.speed * Math.cos @trajectory.angle
    @particle.y += @trajectory.speed * Math.sin @trajectory.angle
    # @particle.rotation = @trajectory.angle

    # apply gravity
    deltaY = @gravity.center.y - @particle.y
    deltaX = @gravity.center.x - @particle.x
    gravity_degrees = Math.atan2( deltaY, deltaX ) * 180 / Math.PI

    # if gravity_degrees < 0 then gravity_degrees = 360+gravity_degrees
    # console.log gravity_degrees

    @particle.x += @gravity.force * Math.cos gravity_degrees
    @particle.y += @gravity.force * Math.sin gravity_degrees

    @stage.addChild @particle

  render: ->

    # @stage.x = translate.x 0
    # @stage.y = translate.y 0

    # @particle = new createjs.Shape()
    # @particle.graphics.beginFill('blue').drawCircle 0, 0, translate.screen @radius
    # @stage.addChild @particle

module.exports = Orbiter