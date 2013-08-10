
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'

class Earth extends Entity

  constructor: ->
    @x = 0
    @y = 0
    @radius = 80

    super

  tick: ->
    @satellite.rotation += .3

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
    @globe.x = -@radius
    @globe.y = -@radius

  updateSatellite: ->
    satelliteScale = translate.screen .2
    satelliteWidth = @satellite.image.width * satelliteScale
    satelliteHeight = @satellite.image.height * satelliteScale

    offsetY = translate.screen 10

    @satellite.scaleX = satelliteScale
    @satellite.scaleY = satelliteScale

    # @satellite.x = -satelliteWidth / 2
    # @satellite.y = -satelliteHeight / 2

    fds = (translate.screen @radius) - satelliteHeight / 2

    @satellite.regX = @satellite.image.width / 2
    @satellite.regY = @satellite.image.height + @radius / satelliteScale - offsetY

module.exports = Earth
