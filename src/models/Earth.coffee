
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
    @satellite.scaleX = translate.screen .5
    @satellite.scaleY = translate.screen .5
    @satellite.x = translate.screen -@radius / 2
    @satellite.y = translate.screen -@satellite.image.height

  render: ->

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    @globe = new createjs.Shape()
    @globe.graphics.beginFill('red').drawCircle 0, 0, translate.screen @radius
    @stage.addChild @globe
    
    @satellite = new createjs.Bitmap 'img/satellite-dish.png'
    @stage.addChild @satellite

module.exports = Earth