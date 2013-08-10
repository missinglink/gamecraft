
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'

class Earth extends Entity

  constructor: ->
    @x = 0
    @y = 0
    @radius = 60

    super

  tick: ->
    @stage.rotation += 1

  render: ->

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    @globe = new createjs.Shape()
    @globe.graphics.beginFill('red').drawCircle 0, 0, translate.screen @radius
    @stage.addChild @globe
    
    @satellite = new createjs.Bitmap 'img/satellite-dish.png'
    @stage.addChild @satellite

    @satellite.image.onload = => @updateSatellite()

  updateSatellite: ->
    satelliteScale = translate.screen .2
    satelliteWidth = @satellite.image.width * satelliteScale
    satelliteHeight = @satellite.image.height * satelliteScale

    offsetY = translate.screen 3

    @satellite.scaleX = satelliteScale
    @satellite.scaleY = satelliteScale
    @satellite.x = translate.screen -satelliteWidth / 2
    @satellite.y = translate.screen -@radius - satelliteHeight + offsetY

module.exports = Earth