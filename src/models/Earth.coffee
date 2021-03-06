
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'
controls = require '../controls'
geometry = require '../helpers/geometry'
status = require '../status'

speedMultiplier = 50
maxSpeed = 4
acceleration = .6
brake = .3

class Earth extends Entity

  constructor: ->
    @x = 0
    @y = 0
    @radius = 100
    @currentSpeed = 0

    super

  tick: ->
    super

    if controls.getDirection() is 0
      if @currentSpeed < 0 then @currentSpeed += brake
      else if @currentSpeed > 0 then @currentSpeed -= brake

      if (Math.abs @currentSpeed) < .2 then @currentSpeed = 0
    else
      @currentSpeed += acceleration * controls.getDirection()

    if @currentSpeed > maxSpeed then @currentSpeed = maxSpeed
    else if @currentSpeed < -maxSpeed then @currentSpeed = -maxSpeed

    @satellite.rotation += @lastFrameLength * @currentSpeed * speedMultiplier / 1000

  hit: (angle, particle) ->
    if Math.abs angle - @satellite.rotation < 3
      console.log 'Nice 1'
    else
      console.log 'Shit!'
      status.removeLife 5
    

  render: ->

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    @globe = new createjs.Bitmap 'img/earth.png'
    @stage.addChild @globe
    
    @satellite = new createjs.Bitmap 'img/satellite-dish.png'
    @stage.addChild @satellite

    @globe.image.onload = => @updateGlobe()
    @satellite.image.onload = => @updateSatellite()

  updateGlobe: ->
    ratio = ( @radius * 2 ) / @globe.image.width
    globeScale = translate.screen ratio
    @globe.scaleX = globeScale
    @globe.scaleY = globeScale
    @globe.x = translate.screen -@radius
    @globe.y = translate.screen -@radius

  updateSatellite: ->
    satelliteScale = translate.screen .4
    satelliteWidth = @satellite.image.width * satelliteScale
    satelliteHeight = @satellite.image.height * satelliteScale

    offsetY = translate.screen 2

    @satellite.scaleX = satelliteScale
    @satellite.scaleY = satelliteScale

    @satellite.regX = @satellite.image.width / 2
    @satellite.regY = @satellite.image.height + (translate.screen @radius / satelliteScale) - offsetY

module.exports = Earth
